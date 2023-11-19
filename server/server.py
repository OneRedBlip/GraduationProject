from flask import Flask, request, session
import database

app = Flask(__name__)
app.secret_key = b"RandomByetesForSecurity"


@app.route("/signup", methods=['POST'])
def signup():
    try:
        data = request.get_json()
        db.insert("users", data)
        return ("User created successfully", 201)
    except Exception as e:
        print("Exception: ", e)
        # TODO Return a better status code
        return ("An error has occured", 500)


@app.route("/login", methods=['POST'])
def login():
    try:
        data = request.get_json()
        userInDB = db.getUserPass(data["user_name"])
        if userInDB is not None and userInDB[1] == data["password"]:
            session["user_id"] = userInDB[0]
            return db.getUserInfo(userInDB[0])
        else:
            return ("Invalid credentials", 401)
    except Exception as e:
        print("Exception: ", e)
        # TODO Return a better status code
        return ("An error has occured", 500)


db = database.Database("database.db")
app.run(host="0.0.0.0", port=8000)
