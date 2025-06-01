
import 'package:zamzam_app/model/login_model.dart';
import 'package:zamzam_app/model/user_model.dart';
import 'package:zamzam_app/service/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthRepository {
  final AuthService authService;

  AuthRepository({required this.authService});

  Future<String?> login(LoginModel user) => authService.logIn(user);

  Future<String?> signUp(UserModel user) => authService.createUser(user);
  Future<void> clearUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('isLoggedIn');
    // await prefs.remove('authToken');
    print('User data cleared from SharedPreferences.'); // للتحقق في Debug Console
  }
}
