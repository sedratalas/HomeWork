import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zamzam_app/model/login_model.dart';
import 'package:zamzam_app/presentation/view/login/bloc/login_event.dart';
import 'package:zamzam_app/presentation/view/login/bloc/login_state.dart';

import '../../../../repositery/auth_repositery.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  final AuthRepository authRepository;
  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<TryLogin>((event,emit) async{
      emit(LoadingState());
      try{
        final String? result = await authRepository.login(
            LoginModel(
                username: event.user.username,
                password: event.user.password,
            )
        );
        if(result==null){
          emit(LoginSuccess());
        }else{
          emit(LoginFailure(error: result));
        }
      }catch(e){
        emit(LoginFailure(error: "An unexpected error occurred: ${e.toString()}"));
      }
    });
  }

  }