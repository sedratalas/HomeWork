import 'package:dio/dio.dart';
import 'package:zamzam_app/model/login_model.dart';
import 'package:zamzam_app/model/user_model.dart';

class AuthService {
  AuthService({required this.dio});

  Dio dio;
  late Response response;
  String baseUrl = "https://zamzaam.onrender.com/";

  Future<String?> logIn(LoginModel user) async {
    try {
      response = await dio.post(baseUrl + "login",
          queryParameters: user.toMap());
      print(response);
      return null;
    } on DioException catch (e) {
      if (e.response != null && e.response!.data is Map<String, dynamic>) {
        if (e.response!.data.containsKey('detail')) {
          return e.response!.data['detail']?.toString() ??
              "Login failed: No details provided.";
        }
        if (e.response!.data.containsKey('message')) {
          return e.response!.data['message']?.toString() ??
              "Login failed: No details provided.";
        }
        if (e.response!.data.containsKey('error')) {
          return e.response!.data['error']?.toString() ??
              "Login failed: No details provided.";
        }
      }
      return "An unknown login error occurred. Status: ${e.response
          ?.statusCode}";
    }
  }

  Future<String?> createUser(UserModel user) async {
    try {
      response = await dio.post(baseUrl + "users/",
          data: user.toJson());
      print(response);
      return null;
    } on DioException catch (e) {
      if (e.response != null && e.response!.data is Map<String, dynamic>) {
        if (e.response!.data.containsKey('detail')) {
          return e.response!.data['detail']?.toString() ??
              "Login failed: No details provided.";
        }
        if (e.response!.data.containsKey('message')) {
          return e.response!.data['message']?.toString() ??
              "Login failed: No details provided.";
        }
        if (e.response!.data.containsKey('error')) {
          return e.response!.data['error']?.toString() ??
              "Login failed: No details provided.";
        }
      }
      return "An unknown login error occurred. Status: ${e.response
          ?.statusCode}";
    }
  }
}
