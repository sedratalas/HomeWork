import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zamzam_app/model/user_model.dart';
import 'package:zamzam_app/presentation/view/signup/bloc/signup_event.dart';
import 'package:zamzam_app/presentation/view/signup/bloc/signup_state.dart';
import 'package:zamzam_app/repositery/auth_repositery.dart';

class SignUpBloc extends Bloc<SignUpEvent,SignUpState>{
  final AuthRepository authRepository;

  SignUpBloc({required this.authRepository}) : super(SignUpInitial()){
    on<TrySignUp>((event,emit)async{
      emit(SignUpLoading());
      try{
        final result = await authRepository.signUp(
          UserModel(
              email: event.user.email,
              username: event.user.username,
              role: event.user.role,
              password: event.user.password
          )
        );
        if(result==null){
          emit(SignUpSuccess());
        }else {
          emit(SignUpFailure(error: result));
        }
      }catch(e){
        emit(SignUpFailure(error: "An unexpected error occurred: ${e.toString()}"));
      }
    });
  }
}