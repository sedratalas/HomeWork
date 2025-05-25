import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/user_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc() : super(LoginInitial()){
    on<TryLogIn>((event,emit) async{
      emit(Loading());
      await  Future.delayed(Duration(seconds: 2));
      if (event.user.password.length>8) {
        emit(SuccessToLogin());
      }else {
        emit(FailedToLogin());
      }
    });
  }
}