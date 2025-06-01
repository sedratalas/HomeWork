class UserModel {
  final String email;
  final String username;
  final String role;
  final String password;

  UserModel({
    required this.email,
    required this.username,
    required this.role,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      username: json['username'],
      role: json['role'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'role': role,
      'password': password,
    };
  }
}
