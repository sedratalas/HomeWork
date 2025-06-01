import 'package:equatable/equatable.dart';
import 'package:zamzam_app/model/login_model.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class TryLogin extends LoginEvent{
  final LoginModel user;
  TryLogin({required this.user});
  @override
  List<Object> get props => [user];
}