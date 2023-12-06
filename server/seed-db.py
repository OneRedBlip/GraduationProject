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
addDemoUsers(users_tuple, db)
