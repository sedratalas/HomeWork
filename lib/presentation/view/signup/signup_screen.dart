import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zamzam_app/model/user_model.dart';
import 'package:zamzam_app/presentation/view/login/login_screen.dart';
import 'package:zamzam_app/presentation/view/signup/bloc/signup_bloc.dart';
import 'package:zamzam_app/presentation/view/signup/bloc/signup_event.dart';
import 'package:zamzam_app/presentation/view/signup/bloc/signup_state.dart';
import 'package:zamzam_app/presentation/view/widget/custom_bottun.dart';
import 'package:zamzam_app/presentation/view/widget/custom_text_field.dart';

import '../../../repositery/auth_repositery.dart';
import '../../../service/auth_service.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  late double ScreenWidth;
  late double ScreenHeight;

  @override
  Widget build(BuildContext context) {
    ScreenWidth = MediaQuery.sizeOf(context).width;
    ScreenHeight = MediaQuery.sizeOf(context).height;
    TextEditingController username = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<SignUpBloc>(
          create: (providerContext) => SignUpBloc(
            authRepository: AuthRepository(
              authService: AuthService(dio: Dio()),
            ),
          ),
          child: Builder(
            builder: (context) {
              return BlocListener<SignUpBloc,SignUpState>(
                listener: (context,state) {
                  if(state is SignUpSuccess){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("SignUp successful!"), backgroundColor: Colors.green,),
                    );
                  }else if(state is SignUpFailure){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("SignUp Failed: ${state.error}"),backgroundColor: Colors.red,),
                    );
                  }
                },
                child: Padding(
                  padding:  EdgeInsets.only(top: ScreenHeight*(124/812), left: ScreenWidth*(30/327), right: ScreenWidth*(30/327),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Create your Account",
                        style: TextStyle(
                            color: Color(0xff8B894E),
                            fontSize: 24,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("Please fill in your details to create your \naccount",
                          style: TextStyle(
                              color: Color(0xff625D5D),
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 39.0, bottom:7 ),
                        child: Text("UserName",
                          style: TextStyle(
                              color: Color(0xff625D5D),
                              fontSize: 14,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                      CustomTextField(
                        controller: username,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 19.0, bottom:7 ),
                        child: Text("Email",
                          style: TextStyle(
                              color: Color(0xff625D5D),
                              fontSize: 14,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                      CustomTextField(
                        controller: email,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 19.0, bottom:7 ),
                        child: Text("Confirm Password",
                          style: TextStyle(
                              color: Color(0xff625D5D),
                              fontSize: 14,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          context.read<SignUpBloc>().add(TrySignUp(
                              user: UserModel(
                                  email: email.text,
                                  username: username.text,
                                  role: "user",
                                  password: password.text
                              ),
                          ),
                          );
                        },
                        child: Padding(
                          padding:  EdgeInsets.only(top: ScreenHeight*(67/812)),
                          child: BlocBuilder<SignUpBloc,SignUpState>(
                            builder: (context,state) {
                              if(state is SignUpLoading){
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }else{
                                return CustomButton(
                                  color: Color(0xff8B894E),
                                  text: Text("CREATE AN ACCOUNT",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }
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
                                  MaterialPageRoute(builder: (context)=> LoginScreen())
                              );
                            },
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(
                                  color: Color(0xff625D5D),
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Sign in",
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
              );
            }
          ),

      ),
    );
  }
}
