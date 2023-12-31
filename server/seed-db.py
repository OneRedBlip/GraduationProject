import database
import bcrypt
import random

demoUsersDict: dict = {}


def generate_arab_username():
    prefixes = ['al', 'abu', 'bin', 'ibn', 'omar', 'ali',
                'fatima', 'amin', 'salim', 'hassan', 'khalid', 'sarah']
    suffixes = ['88', '91', '77', '123', '456', '999', '786', '555', '333', '2000', '231', '_cool', '-boss',
                'XxX', 'ZzZ', '001', '000', '22', '33', '44', '55', '66', '77', '88', '99', '101', '121', '219']
    return random.choice(prefixes) + random.choice(suffixes)


def generate_arab_email():
    domains = ['gmail.com', 'yahoo.com', 'hotmail.com', 'outlook.com']
    return generate_arab_username() + '@' + random.choice(domains)


def generate_saudi_city():
    saudi_cities = ['riyadh', 'jeddah', 'dammam', 'khobar', 'jubail']
    return random.choice(saudi_cities)


# Create a tuple of dictionaries
demo_users = [
    {'user_name': generate_arab_username(), 'email': generate_arab_email(
    ), 'phone_num': '1234567890', 'user_location': generate_saudi_city()},
    # Add more dictionaries as needed
]


def generate_random_phone_number():
    # Ensure the phone number starts with "05"
    phone_number = '05'

    # Add 8 more random digits to the phone number
    for _ in range(8):
        phone_number += str(random.randint(0, 9))

    return phone_number


# Generate 59 more items
for _ in range(99):
    demo_users.append({'user_name': generate_arab_username(), 'email': generate_arab_email(
    ), 'phone_num': generate_random_phone_number(), 'user_location': generate_saudi_city()})

demo_users.append({'user_name': "demouser", 'email': "DemoEmail@example.com",
                   'phone_num': generate_random_phone_number(), 'user_location': "jubail"})

demo_users.append({'user_name': "otheruser", 'email': "another@example.com",
                   'phone_num': generate_random_phone_number(), 'user_location': "jubail"})

# Convert the list to a tuple
users_tuple = tuple(demo_users)


def addDemoUsers(users: tuple[dict, ...], db) -> None:
    for user in users:
        try:
            user["password"] = bcrypt.hashpw("123".encode(), bcrypt.gensalt())
            user["points"] = 1750
            query = '''INSERT INTO users ('user_name', email, phone_num, password, user_location, points)
                       VALUES(:user_name, :email, :phone_num, :password, :user_location, :points)'''
            db.cur.execute(query, user)

            # db.insert("users", user)
        except:
            continue


demo_posts = (
    {"user_id": 15, "post_date": 1703024600, "material_type": "Paper", "location": "riyadh",
        "additional_info": "Old newspapers for recycling.", "status": "o"},
    {"user_id": 16, "post_date": 1703024700, "material_type": "Glass", "location": "riyadh",
        "additional_info": "Broken glass pieces, suitable for recycling.", "status": "o"},
    {"user_id": 17, "post_date": 1703024550, "material_type": "Plastic", "location": "riyadh",
        "additional_info": "Empty plastic containers available for pickup.", "status": "o"},
    {"user_id": 18, "post_date": 1703024520, "material_type": "Metal", "location": "riyadh",
        "additional_info": "Scrap metal from renovation project.", "status": "o"},
    {"user_id": 19, "post_date": 1703024220, "material_type": "Paper", "location": "dammam",
        "additional_info": "Cardboard boxes for recycling.", "status": "o"},
    {"user_id": 20, "post_date": 1703023500, "material_type": "Glass", "location": "dammam",
        "additional_info": "Used glass bottles available for collection.", "status": "o"},
    {"user_id": 21, "post_date": 1703022700, "material_type": "Metal", "location": "dammam",
        "additional_info": "Copper wires and pipes from home renovation.", "status": "o"},
    {"user_id": 22, "post_date": 1703021700, "material_type": "Plastic", "location": "riyadh",
        "additional_info": "Plastic containers and packaging materials available.", "status": "o"},
    {"user_id": 23, "post_date": 1703020700, "material_type": "paper", "location": "jubail",
        "additional_info": "Assorted paper materials for recycling.", "status": "o"},
    {"user_id": 24, "post_date": 1703023700, "material_type": "Glass", "location": "jubail",
        "additional_info": "Empty glass jars and bottles for pickup.", "status": "o"},
    {"user_id": 25, "post_date": 1703021700, "material_type": "Metal", "location": "dammam",
        "additional_info": "Scrap metal pieces, suitable for recycling.", "status": "o"},
    {"user_id": 26, "post_date": 1703024700, "material_type": "Plastic", "location": "riyadh",
        "additional_info": "Plastic bags and packaging available for reuse.", "status": "o"},
    {"user_id": 27, "post_date": 1703024700, "material_type": "Paper", "location": "dammam",
        "additional_info": "Unused cardboard sheets and boxes.", "status": "o"},
    {"user_id": 28, "post_date": 1703024700, "material_type": "Glass", "location": "jubail",
        "additional_info": "Assorted glass items for recycling.", "status": "o"},
    {"user_id": 29, "post_date": 1703024700, "material_type": "Metal", "location": "riyadh",
        "additional_info": "Old aluminum cans and scrap.", "status": "o"},
    {"user_id": 30, "post_date": 1703024700, "material_type": "Plastic", "location": "dammam",
        "additional_info": "Plastic bottles and containers available.", "status": "o"},
    {"user_id": 50, "post_date": 1703024700, "material_type": "Plastic", "location": "dammam",
        "additional_info": "Plastic packaging materials for recycling.", "status": "o"},
)


def addDemoPosts(posts: tuple[dict, ...], db: database.Database) -> None:
    for post in posts:
        db.insert("posts", post)


db = database.Database("database.db")

db.cur.execute('''INSERT INTO "main"."rewards" ("reward_id", "reward_name", "points_required", "reward_desc") VALUES ('1', 'Tamimi', '350', 'Coupon Value: 100 SR')''')
db.cur.execute('''INSERT INTO "main"."rewards" ("reward_id", "reward_name", "points_required", "reward_desc") VALUES ('2', 'Panda', '350', 'Coupon Value: 100 SR')''')
db.cur.execute('''INSERT INTO "main"."rewards" ("reward_id", "reward_name", "points_required", "reward_desc") VALUES ('3', 'Lulu hypermarket', '350', 'Coupon Value: 100 SR')''')
db.cur.execute('''INSERT INTO "main"."rewards" ("reward_id", "reward_name", "points_required", "reward_desc") VALUES ('4', 'HungerStation', '75', 'Coupon Value: 25 SR')''')
db.con.commit()
addDemoUsers(users_tuple, db)
addDemoPosts(demo_posts, db)
