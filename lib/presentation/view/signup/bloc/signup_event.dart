import 'package:equatable/equatable.dart';
import 'package:zamzam_app/model/user_model.dart';

abstract class SignUpEvent extends Equatable{
  const SignUpEvent();
  @override
  List<Object?> get props => [];
}

class TrySignUp extends SignUpEvent{
  final UserModel user;
  TrySignUp({required this.user});

  @override
  // TODO: implement props
  List<Object?> get props => [user];

}