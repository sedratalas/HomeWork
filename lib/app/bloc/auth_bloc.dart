import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';
//using shared preferences
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
     _loadAuthState();
    on<UserSaved>((event, emit) async {
       final prefs = await SharedPreferences.getInstance();
       await prefs.setBool('isLoggedIn', true);
      emit(UserAuthorized());
    });
  }
  void _loadAuthState() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      emit(UserAuthorized());
    } else {
      emit(AuthInitial());
    }
  }
}

// class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
//   AuthBloc() : super(AuthInitial()) {
//     on<UserSaved>((event, emit) {
//       emit(UserAuthorized());
//     });
//   }
//
//   @override
//   AuthState fromJson(Map<String, dynamic> json) {
//     final status = json['status'] as String?;
//     if (status == 'authorized') return UserAuthorized();
//     return AuthInitial();
//   }
//
//   @override
//   Map<String, dynamic> toJson(AuthState state) {
//     if (state is UserAuthorized) {
//       return {'status': 'authorized'};
//     }
//     return {'status': 'initial'};
//   }
// }
