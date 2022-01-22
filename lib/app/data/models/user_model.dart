class UserModel {
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.jwt,
  });

  int id;
  String username;
  String email;
  String jwt;

  factory UserModel.fromJson(Map<String, dynamic> request) {
    String jwt = request['jwt'];
    Map<String, dynamic> user = request['user'];
    return UserModel(
      id: user["id"],
      username: user["name"],
      email: user["email"],
      jwt: jwt,
    );
  }

  factory UserModel.empty() {
    return UserModel(
      id: 0,
      username: '',
      email: '',
      jwt: '',
    );
  }
}
