To use the “Trash to Treasure” project you need to install both python and flutter.

Python:
1- Install python version 3.11 or higher. We recommend installing via Anaconda: https://www.anaconda.com/download
2- Navigate to the /server directory in a terminal.
3- Make sure the dependencies are installed using the command: pip install -r requirements.txt
4- (optional) Run the seed-db.py script to add some data to the database: python seed-db.py
5- start the server: python server.py
By default, the server will listen on port 8000 on all IPv4 interfaces. This can be changed by editing the last line in the server.py file.

Flutter:
1- Install flutter by following this guide: https://docs.flutter.dev/get-started/install
We used flutter version 3.13.9 during development but we expect the app to work with future versions of flutter 3
2- Navigate to the /trash2treasure directory in a terminal.
3- Install all dependencies using the following command: flutter pub get
4- Run the app using the command: flutter run
Note: The app assumes that the server is running on localhost and port 8000. Changing this requires editing several files in the /trash2treasure/lib/ directory.
