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

  factory UserData.fromJson(Map<String, dynamic> json, String cookie) {
    return UserData(
        json['user_name'],
        json['email'],
        json['user_location'],
        json['phone_num'].toString(),
        json['points'],
        json['user_id'],
        cookie);
  }

  void setPoints(int newPoints) {
    points = newPoints;
  }
}
