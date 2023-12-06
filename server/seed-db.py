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

demo_users.append({'user_name': "demouser", 'email': "DemoEmailAddress@example.com",
                   'phone_num': generate_random_phone_number(), 'user_location': "jubail"})

# Convert the list to a tuple
users_tuple = tuple(demo_users)


def addDemoUsers(users: tuple[dict, ...], db) -> None:
    for user in users:
        try:
            user["password"] = bcrypt.hashpw("123".encode(), bcrypt.gensalt())
            db.insert("users", user)
        except:
            continue


db = database.Database("database.db")
db.cur.execute("UPDATE users SET points = 1750 WHERE points = 0")
db.con.commit()

demo_posts = (
    {"user_id": 15, "post_date": 170198992, "material_type": "paper", "location": "riyadh",
        "additional_info": "Old newspapers for recycling.", "status": "o"},
    {"user_id": 16, "post_date": 170198992, "material_type": "glass", "location": "riyadh",
        "additional_info": "Broken glass pieces, suitable for recycling.", "status": "o"},
    {"user_id": 17, "post_date": 1770498992, "material_type": "plastic", "location": "riyadh",
        "additional_info": "Empty plastic containers available for pickup.", "status": "o"},
    {"user_id": 18, "post_date": 170198992, "material_type": "metal", "location": "riyadh",
        "additional_info": "Scrap metal from renovation project.", "status": "o"},
    {"user_id": 19, "post_date": 170198992, "material_type": "paper", "location": "dammam",
        "additional_info": "Cardboard boxes for recycling.", "status": "o"},
    {"user_id": 20, "post_date": 170198992, "material_type": "glass", "location": "dammam",
        "additional_info": "Used glass bottles available for collection.", "status": "o"},
    {"user_id": 21, "post_date": 170198992, "material_type": "metal", "location": "dammam",
        "additional_info": "Copper wires and pipes from home renovation.", "status": "o"},
    {"user_id": 22, "post_date": 2290499064, "material_type": "plastic", "location": "riyadh",
        "additional_info": "Plastic containers and packaging materials available.", "status": "o"},
    {"user_id": 23, "post_date": 1170498992, "material_type": "paper", "location": "jubail",
        "additional_info": "Assorted paper materials for recycling.", "status": "o"},
    {"user_id": 24, "post_date": 170199153, "material_type": "glass", "location": "jubail",
        "additional_info": "Empty glass jars and bottles for pickup.", "status": "o"},
    {"user_id": 25, "post_date": 170199076, "material_type": "metal", "location": "dammam",
        "additional_info": "Scrap metal pieces, suitable for recycling.", "status": "o"},
    {"user_id": 26, "post_date": 170198992, "material_type": "plastic", "location": "riyadh",
        "additional_info": "Plastic bags and packaging available for reuse.", "status": "o"},
    {"user_id": 27, "post_date": 170198992, "material_type": "paper", "location": "dammam",
        "additional_info": "Unused cardboard sheets and boxes.", "status": "o"},
    {"user_id": 28, "post_date": 170199032, "material_type": "glass", "location": "jubail",
        "additional_info": "Assorted glass items for recycling.", "status": "o"},
    {"user_id": 29, "post_date": 170199004, "material_type": "metal", "location": "riyadh",
        "additional_info": "Old aluminum cans and scrap.", "status": "o"},
    {"user_id": 30, "post_date": 170199184, "material_type": "plastic", "location": "dammam",
        "additional_info": "Plastic bottles and containers available.", "status": "o"},
    {"user_id": 50, "post_date": 170199022, "material_type": "plastic", "location": "dammam",
        "additional_info": "Plastic packaging materials for recycling.", "status": "o"},
)


def addDemoPosts(posts: tuple[dict, ...], db: database.Database) -> None:
    for post in posts:
        db.insert("posts", post)


addDemoUsers(users_tuple, db)
addDemoPosts(demo_posts, db)
