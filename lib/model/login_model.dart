import 'dart:convert';
class ResultData {}

class ErrorData extends ResultData{
  String message;
  ErrorData({
    required this.message,
  });
}
class LoginModel extends ResultData{
  String usename;
  String password;
  LoginModel({
    required this.usename,
    required this.password,
  });

  LoginModel copyWith({
    String? usename,
    String? password,
  }) {
    return LoginModel(
      usename: usename ?? this.usename,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': usename,
      'password': password,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      usename: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(username: $usename, password: $password)';

  @override
  bool operator ==(covariant LoginModel other) {
    if (identical(this, other)) return true;

    return
      other.usename == usename &&
          other.password == password;
  }

  @override
  int get hashCode => usename.hashCode ^ password.hashCode;
}