import 'package:dio/dio.dart';
import 'package:zamzam_app/model/login_model.dart';

class AuthService{
  Dio dio;
  late Response response;
String baseUrl = "https://zamzaam.onrender.com/docs#/default/login_login_post";

  AuthService(this.dio);

  Future<bool> logIn(LoginModel user)async{
try{
response = await dio.post(baseUrl,data: user.toJson());
return true;
}catch(e){
  print(e);
  return false;
}

  }
}