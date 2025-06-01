import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zamzam_app/model/login_model.dart';
import 'package:zamzam_app/presentation/view/login/bloc/login_bloc.dart';
import 'package:zamzam_app/presentation/view/login/bloc/login_state.dart';
import 'package:zamzam_app/presentation/view/signup/signup_screen.dart';
import 'package:zamzam_app/presentation/view/widget/custom_bottun.dart';
import 'package:zamzam_app/presentation/view/widget/custom_text_field.dart';
import 'package:zamzam_app/repositery/auth_repositery.dart';
import 'package:zamzam_app/service/auth_service.dart';

import '../../../app/bloc/auth_bloc.dart';
import 'bloc/login_event.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
   late double ScreenWidth;
   late double ScreenHeight;

  @override
  Widget build(BuildContext context) {
    ScreenWidth = MediaQuery.sizeOf(context).width;
    ScreenHeight = MediaQuery.sizeOf(context).height;
    TextEditingController userName = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context,state) {
          if(state is LoginSuccess){
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Login successful!"),backgroundColor: Colors.green,),
            );
            context.read<AuthBloc>().add(UserSaved());
          }else if (state is LoginFailure){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Login Failed: ${state.error}"),backgroundColor: Colors.red,),
            );
                }
        },
        child: Padding(
          padding:  EdgeInsets.only(top: ScreenHeight*(124/812), left: ScreenWidth*(30/327), right: ScreenWidth*(30/327),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome Back!",
                style: TextStyle(
                  color: Color(0xff8B894E),
                  fontSize: 24,
                  fontWeight: FontWeight.w700
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text("Please fill in your email password to login\nto your account.",
                  style: TextStyle(
                      color: Color(0xff625D5D),
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 39.0, bottom:7 ),
                child: Text("Username",
                  style: TextStyle(
                      color: Color(0xff625D5D),
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),
              CustomTextField(
                  controller: userName,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 19.0, bottom:7 ),
                child: Text("Password",
                  style: TextStyle(
                      color: Color(0xff625D5D),
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),
              CustomTextField(
                controller: password,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot Password?"),
                ],
              ),
              GestureDetector(
                onTap: (){
                  context.read<LoginBloc>().add(
                    TryLogin(
                      user: LoginModel(
                        username: userName.text,
                        password: password.text,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding:  EdgeInsets.only(top: ScreenHeight*(145/812)),
                  child: BlocBuilder<LoginBloc,LoginState>(
                    builder: (context,state) {
                      if(state is LoadingState){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return CustomButton(
                        color: Color(0xff8B894E),
                          text: Text("LOGIN",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                      );
                    }
                  ),
                ),
              ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context)=> SignupScreen())
                  );
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      color: Color(0xff625D5D),
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          color: Color(0xff8B894E),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
