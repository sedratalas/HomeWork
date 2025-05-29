import 'package:flutter/material.dart';
import 'package:zamzam_app/presentation/view/signup/signup_screen.dart';
import 'package:zamzam_app/presentation/view/widget/custom_bottun.dart';
import 'package:zamzam_app/presentation/view/widget/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
   late double ScreenWidth;
   late double ScreenHeight;

  @override
  Widget build(BuildContext context) {
    ScreenWidth = MediaQuery.sizeOf(context).width;
    ScreenHeight = MediaQuery.sizeOf(context).height;
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Forgot Password?"),
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(top: ScreenHeight*(145/812)),
              child: CustomButton(
                color: Color(0xff8B894E),
                  text: Text("LOGIN",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
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
    );
  }
}
