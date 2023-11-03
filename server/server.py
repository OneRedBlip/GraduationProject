from flask import Flask, request

app = Flask(__name__)


@app.route("/", methods=['POST'])
def handleRequest():
    try:
        data = request.get_json()
        print("Received data:\n", data)
        # TODO Actually authenticate
        print(authUser(data))
        # TODO Actually Return user info
        return ("Data Received Successfully", 200)
    except Exception as e:
        print("Exception: ", e)
        # TODO Return a better status code
        return ("An error has occured", 500)


def authUser(credentials: dict):
    try:
        return (usersAndPasswords[credentials["username"]] == credentials["password"])
    except Exception:
        return False


# TODO use a real DB
usersAndPasswords: dict = {"fakeUser": "123"}
app.run(host="0.0.0.0", port=8000)
