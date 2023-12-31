import sqlite3


class Database:
    def __init__(self, db_path: str) -> None:
        self.con: sqlite3.Connection = sqlite3.connect(db_path, check_same_thread=False)
        self.cur: sqlite3.Cursor = self.con.cursor()
        self.cur.execute("PRAGMA foreign_keys = ON")

        # TODO: implement ON UPDATE statements for applicable tables

        # users table
        self.cur.execute('''
            CREATE TABLE IF NOT EXISTS users (
                user_id INTEGER PRIMARY KEY AUTOINCREMENT,
                user_name VARCHAR UNIQUE NOT NULL,
                email VARCHAR,
                phone_num INT NOT NULL,
                password VARCHAR NOT NULL,
                points INT NOT NULL DEFAULT 0,
                user_location VARCHAR NOT NULL
            )
        ''')

        # rewards table
        self.cur.execute('''
            CREATE TABLE IF NOT EXISTS rewards (
                reward_id INTEGER PRIMARY KEY AUTOINCREMENT,
                reward_name VARCHAR NOT NULL,
                points_required INT NOT NULL,
                reward_desc VARCHAR NOT NULL
            )
        ''')

        # posts table
        self.cur.execute('''
            CREATE TABLE IF NOT EXISTS posts (
                post_id INTEGER PRIMARY KEY AUTOINCREMENT,
                user_id INTEGER REFERENCES users (user_id),
                post_date INT NOT NULL,
                material_type VARCHAR NOT NULL,
                location VARCHAR NOT NULL,
                additional_info VARCHAR,
                status VARCHAR NOT NULL
            )
        ''')

        # centers table
        self.cur.execute('''
            CREATE TABLE IF NOT EXISTS centers (
                center_id INTEGER PRIMARY KEY AUTOINCREMENT,
                center_name VARCHAR NOT NULL,
                material_type CHAR NOT NULL,
                location VARCHAR NOT NULL,
                hours TEXT,
                additional_info VARCHAR
            )
        ''')

        # rewards_users table
        self.cur.execute('''
            CREATE TABLE IF NOT EXISTS rewards_users (
                reward_history_id INTEGER PRIMARY KEY AUTOINCREMENT,
                user_id INTEGER REFERENCES users (user_id),
                reward_id INTEGER REFERENCES rewards (reward_id),
                redeem_date INT NOT NULL,
                redeem_amount INT NOT NULL
            )
        ''')

        # users_centers table
        self.cur.execute('''
            CREATE TABLE IF NOT EXISTS users_centers (
                center_history_id INTEGER PRIMARY KEY AUTOINCREMENT,
                user_id INTEGER REFERENCES users (user_id),
                center_id INTEGER REFERENCES centers (center_id),
                gain_date INT NOT NULL,
                gained_amount INT NOT NULL
            ) ''')

        self.cur.executescript('''
                               CREATE TRIGGER IF NOT EXISTS check_points_and_redeem
                               BEFORE INSERT ON rewards_users FOR EACH ROW
                               WHEN CASE WHEN (SELECT points FROM users WHERE user_id = NEW.user_id) < (NEW.redeem_amount)
                               THEN RAISE (ABORT, "Not enough points!") 
                               ELSE TRUE
                               END
                               BEGIN
                               UPDATE users SET points = points - NEW.redeem_amount WHERE user_id = NEW.user_id;
                               END
                               ''')

        self.con.commit()

    def insert(self, table_name: str, data: dict) -> int:
        match table_name:
            case "users":
                query = '''INSERT INTO users ('user_name', email, phone_num, password, user_location)
                           VALUES(:user_name, :email, :phone_num, :password, :user_location)'''
            case "rewards":
                query = '''INSERT INTO rewards (reward_name, points_required, reward_desc)
                           VALUES(:reward_name, :points_required, :reward_desc)'''
            case "posts":
                query = '''INSERT INTO posts (user_id, post_date, material_type, location, additional_info, status)
                           VALUES(:user_id, :post_date, :material_type, :location, :additional_info, :status)'''
            case "centers":
                query = '''INSERT INTO centers (center_name, material_type, location, hours, additional_info)
                           VALUES(:center_name, :material_type, :location, :hours, :additional_info)'''
            case "rewards_users":
                query = '''INSERT INTO rewards_users (user_id, reward_id, redeem_date, redeem_amount)
                           VALUES(:user_id, :reward_id, :redeem_date, :redeem_amount)'''
            case "users_centers":
                query = '''INSERT INTO users_center (user_id, center_id, gain_date, gained_amount)
                           VALUES(:user_id, :center_id, :gain_date, :gained_amount)'''
            case _:
                raise ValueError
                # TODO throw a better exception

        self.cur.execute(query, data)
        self.con.commit()
        return self.cur.lastrowid

    def getUserInfo(self, user_id: int, ) -> dict[str, str]:  # Return types incorrect 🤷.
        res = self.cur.execute(
            "SELECT user_name, email, phone_num, points, user_location, user_id FROM users WHERE user_id = ?", (user_id,)).fetchone()
        if res is None:
            return None
        return {"user_name": res[0], "email": res[1], "phone_num": res[2], "points": res[3], "user_location": res[4], "user_id": res[5]}

    def getUserPass(self, user_name: str, ) -> tuple[int, str]:
        res = self.cur.execute(
            "SELECT user_id, password FROM users WHERE user_name = ?", (user_name,)).fetchone()
        return res

    def getCenterInfo(self, center_id: int, ) -> tuple[str, str, str, dict, str]:
        res = self.cur.execute(
            "SELECT  center_name, material_type, location, hours, additional_info FROM centers WHERE center_id = ?", (center_id,)).fetchone()
        return res

    def getCentersInLocation(self, location: str, ) -> dict[dict, ...]:
        res = self.cur.execute(
            "SELECT center_id, center_name, material_type, location, hours, additional_info FROM centers WHERE location = ?", (location,)).fetchall()
        # using fetchall is kinda wrong. but should be fine for this prototype.
        return self.centersToDict(res)

    def getPostsInLocation(self, location: str, ) -> dict[dict, ...]:
        res = self.cur.execute(
            "SELECT post_id, user_id, post_date, material_type, location, additional_info, status FROM posts WHERE location = ?", (location,)).fetchall()
        # TODO: sort query
        return self.postsToDict(res)

    def getPostsByMaterial(self, material: str, ) -> dict[dict, ...]:
        res = self.cur.execute(
            "SELECT post_id, user_id, post_date, material_type, location, additional_info, status FROM posts WHERE material_type = ?", (material,)).fetchall()
        # TODO: sort query
        return self.postsToDict(res)

    def getPostsByMaterialAndLocation(self, material: str, location: str) -> dict[dict, ...]:
        res = self.cur.execute(
            "SELECT post_id, user_id, post_date, material_type, location, additional_info, status FROM posts WHERE material_type = ? AND location = ?", (material, location)).fetchall()
        # TODO: sort query
        return self.postsToDict(res)

    def getRewards(self) -> dict[dict, ...]:
        res = self.cur.execute("SELECT reward_id, reward_name, points_required, reward_desc FROM rewards")
        return self.rewardsToDict(res)

    def rewardsToDict(self, input: tuple[tuple, ...]):
        rewards_dict = {}
        for row in input:
            reward_id, reward_name, points_required, reward_desc = row
            reward_dict = {
                "reward_id": reward_id,
                "reward_name": reward_name,
                "points_required": points_required,
                "reward_desc": reward_desc
            }
            # Add the created dictionary to the main dictionary using reward_id as the key
            rewards_dict[reward_id] = reward_dict
        return rewards_dict

    def postsToDict(self, input: tuple[tuple, ...]):
        posts_dict = {}
        for row in input:
            post_id, user_id, post_date, material_type, location, additional_info, status = row
            post_dict = {
                "user_id": user_id,
                "post_date": post_date,
                "material_type": material_type,
                "location": location,
                "additional_info": additional_info,
                "status": status
            }
            # Add the created dictionary to the main dictionary using post_id as the key
            posts_dict[post_id] = post_dict
        return posts_dict

    def centersToDict(self, input: tuple[tuple, ...]):
        centers_dict = {}
        for row in input:
            center_id, center_name, material_type, location, hours, additional_info = row
            center_dict = {
                "center_name": center_name,
                "material_type": material_type,
                "location": location,
                "hours": hours,
                "additional_info": additional_info
            }
            # Add the created dictionary to the main dictionary using center_id as the key
            centers_dict[center_id] = center_dict
        return centers_dict
    # TODO: figure out what data we need to fetch
