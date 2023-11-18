from flask import Flask, request
import database

app = Flask(__name__)


@app.route("/", methods=['POST'])
def handleRequest():
    try:
        data = request.get_json()
        print("Received data:\n", data)
        # TODO Actually authenticate
        # TODO Actually Return user info
        return ("Data Received Successfully", 200)
    except Exception as e:
        print("Exception: ", e)
        # TODO Return a better status code
        return ("An error has occured", 500)


db = database.Database("database.db")
app.run(host="0.0.0.0", port=8000)
