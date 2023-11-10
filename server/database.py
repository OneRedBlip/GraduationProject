import sqlite3


class Database:
    def __init__(self, db_path: str) -> None:
        self.con: sqlite3.Connection = sqlite3.connect(db_path)
        self.cur: sqlite3.Cursor = self.con.cursor()

    def create_table(self, table_name: str, columns: list[tuple[str, str]]) -> None:
        query = f"CREATE TABLE IF NOT EXISTS {table_name} ({', '.join([f'{col[0]} {col[1]}' for col in columns])})"
        self.cur.execute(query)

    def insert(self, table_name: str, data: dict) -> None:
        match table_name:
            case "users":
                query = 'INSERT INTO users VALUES(:user_id, :user_name, :email, :phone_num, :password, :points, :user_location)'
            case "rewards":
                query = 'INSERT INTO rewards VALUES(:reward_id, :reward_name, points_required, :reward_desc)'
            case "posts":
                query = 'INSERT INTO posts VALUES(:post_id, :user_id, :post_date, :material_type, :location, :additional_info, :status)'
            case "centers":
                query = 'INSERT INTO centers VALUES(:center_id, :center_name, :material_type, :location, :hours, :additional_info'
            case "rewards_users":
                query = 'INSERT INTO rewards_users VALUES(:reward_history_id, :user_id, :reward_id, :redeem_date, :redeemed_amount'
            case "users_centers":
                query = 'INSERT INTO users_center VALUES(:center_history_id :user_id, :center_id, :gain_date, :gained_amount'
            case _:
                raise ValueError
                # TODO throw a better exception

        self.cur.execute(query, data)
