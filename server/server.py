from flask import Flask, request, session
import time
import database
import bcrypt

app = Flask(__name__)
app.secret_key = b"RandomByetesForSecurity"


@app.route("/signup", methods=['POST'])
def signup():
    try:
        data = request.get_json()
        data["password"] = bcrypt.hashpw(data["password"].encode(), bcrypt.gensalt())
        id: int = db.insert("users", data)
        userInDB = db.getUserInfo(id)
        session["user_id"] = userInDB["user_id"]
        return userInDB
    except Exception as e:
        print("Exception: ", e)
        # TODO Return a better status code
        return ("An error has occured", 500)


@app.route("/login", methods=['POST'])
def login():
    try:
        data = request.get_json()
        userInDB = db.getUserPass(data["user_name"])
        if userInDB is not None and bcrypt.checkpw(data["password"].encode(), userInDB[1]):
            session["user_id"] = userInDB[0]
            return db.getUserInfo(userInDB[0])
        else:
            return ("Invalid credentials", 401)
    except Exception as e:
        print("Exception: ", e)
        # TODO Return a better status code
        return ("An error has occured", 500)


@app.route("/posts", methods=['POST', 'GET'])
def getPosts():
    try:
        data = request.get_json()
        if data["searchBy"] == "location":
            return db.getPostsInLocation(data["location"].lower())
        # TODO: implement other search criteria
    except Exception as e:
        print("Exception: ", e)
        # TODO Return a better status code
        return ("An error has occured", 500)


@app.route("/newpost", methods=['POST'])
def newPost():
    try:
        data = request.get_json()
        id = session["user_id"]
        db.insert("posts", {"user_id": id, "material_type": data["material_type"], "post_date": int(
            time.time()), "location": data["location"].lower(), "additional_info": data["additional_info", "status": "o"]})
        return ("", 200)
    except Exception as e:
        print("Exception: ", e)
        # TODO Return a better status code
        return ("An error has occured", 500)


@app.route("/rewards", methods=['POST', 'GET'])
def getRewards():
    try:
        return db.getRewards()
    except Exception as e:
        print("Exception: ", e)
        # TODO Return a better status code
        return ("An error has occured", 500)


@app.route("/redeemreward", methods=['POST'])
def redeemReward():
    try:
        data = request.get_json()
        id = session["user_id"]
        reward_id = int(data["reward_id"])
        rewardInfo: dict = db.getRewards()[reward_id]
        if db.getUserInfo(id)['points'] < rewardInfo['points_required']:
            return ("Not enough points", 500)
        db.insert("rewards_users", {"user_id": id, "reward_id": reward_id, "redeem_date": int(
            time.time()), "redeem_amount": rewardInfo["points_required"]})
        return ("", 200)
    except Exception as e:
        print("Exception: ", e)
        # TODO Return a better status code
        return ("An error has occured", 500)


db = database.Database("database.db")
app.run(host="0.0.0.0", port=8000)
