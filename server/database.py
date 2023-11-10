import sqlite3


class Database:
    def __init__(self, db_path: str) -> None:
        self.con: sqlite3.Connection = sqlite3.connect(db_path)
        self.cur: sqlite3.Cursor = self.con.cursor()

        # TODO: add ON UPDATE logic to applicable tables
        self.create_table("users", [("user_id", "INTEGER PRIMARY KEY AUTOINCREMENT"),
                                    ("user_name", "VARCHAR NOT NULL"), ("email", "VARCHAR"),
                                    ("password", "VARCHAR NOT NULL"), ("points", "INT NOT NULL DEFAULT 0"),
                                    ("user_location", "VARCHAR NOT NULL")])

        self.create_table("rewards", [("reward_id", "INTEGER PRIMARY KEY AUTOINCREMENT"),
                                      ("reward_name", "VARCHAR NOT NULL"), ("points_required", "INT NOT NULL"),
                                      ("reward_desc", "VARCHAR NOT NULL")])

        self.create_table("posts", [("post_id", "INTEGER PRIMARY KEY AUTOINCREMENT"),
                                    ("user_id", "INTEGER REFERENCES users (user_id)"), ("post_date", "INT NOT NULL"),
                                    ("material_type", "VARCHAR NOT NULL"), ("location", "VARCHAR NOT NULL"),
                                    ("additional_info", "VARCHAR"), ("status", "VARCHAR NOT NULL")])

        self.create_table("centers", [("center_id", "INTEGER PRIMARY KEY AUTOINCREMENT"),
                                      ("center_name", "VARCHAR NOT NULL"), ("material_type", "CHAR NOT NULL"),
                                      ("location", "VARCHAR NOT NULL"), ("hours", "TEXT"), ("additional_info", "VARCHAR")])

        self.create_table("rewards_users ", [("reward_history_id", "INTEGER PRIMARY KEY AUTOINCREMENT"),
                                             ("user_id", "INTEGER REFERENCES users (user_id)"),
                                             ("rewards_id", "INTEGER REFERENCES rewards (reward_id)"),
                                             ("redeem_date", "INT NOT NULL"), ("redeem_amount", "INT NOT NULL")])

        self.create_table("users_centers", [("center_history_id", "INTEGER PRIMARY KEY AUTOINCREMENT"),
                                            ("user_id", "INTEGER REFERENCES users (user_id)"),
                                            ("center_id", "INTEGER REFERENCES centers (center_id)"),
                                            ("gain_date", "INT NOT NULL"), ("gained_amount", "INT NOT NULL")])

    def create_table(self, table_name: str, columns: list[tuple[str, str]]) -> None:
        query = f"CREATE TABLE IF NOT EXISTS {table_name} ({', '.join([f'{col[0]} {col[1]}' for col in columns])})"
        self.cur.execute(query)
        self.con.commit()

    def insert(self, table_name: str, data: dict) -> None:
        match table_name:
            case "users":
                query = "INSERT INTO users VALUES(:user_id, :user_name, :email, :phone_num, :password, :points, :user_location)"
            case "rewards":
                query = "INSERT INTO rewards VALUES(:reward_id, :reward_name, points_required, :reward_desc)"
            case "posts":
                query = "INSERT INTO posts VALUES(:post_id, :user_id, :post_date, :material_type, :location, :additional_info, :status)"
            case "centers":
                query = "INSERT INTO centers VALUES(:center_id, :center_name, :material_type, :location, :hours, :additional_info)"
            case "rewards_users":
                query = "INSERT INTO rewards_users VALUES(:reward_history_id, :user_id, :reward_id, :redeem_date, :redeemed_amount)"
            case "users_centers":
                query = "INSERT INTO users_center VALUES(:center_history_id :user_id, :center_id, :gain_date, :gained_amount)"
            case _:
                raise ValueError
                # TODO throw a better exception

        self.cur.execute(query, data)
        self.con.commit()
    
    # TODO: figure out what data we need to fetch
