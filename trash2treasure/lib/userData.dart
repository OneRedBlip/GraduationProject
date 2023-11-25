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

  factory UserData.fromJson(Map<String, dynamic>? json, String cookie) {
    return UserData(
        json?['user_name'] ?? "testuser",
        json?['email'] ?? "fakeemail@example.com",
        json?['user_location'] ?? "jubail",
        json?['phone_num'].toString() ?? "52131",
        json?['points'] ?? 0,
        json?['user_id'] ?? 1,
        cookie);
  }

  void setPoints(int newPoints) {
    points = newPoints;
  }
}
