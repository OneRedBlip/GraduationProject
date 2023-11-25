class UserData {
  final String userName;
  final String email;
  final String location;
  final String phoneNumber;
  int points;
  final int userID;
  final String sessionCookie;

  UserData(this.userName, this.email, this.location, this.phoneNumber,
      this.points, this.userID, this.sessionCookie);

  void setPoints(int newPoints){
  points = newPoints;
  }
}
