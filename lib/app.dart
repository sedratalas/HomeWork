
import 'package:flutter/material.dart';
import 'package:zamzam_app/presentation/view/on_boarding/on_boarding_screen.dart';

import 'presentation/view/login/login_screen.dart';
import 'presentation/view/signup/signup_screen.dart';
import 'presentation/view/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupScreen(),
    );
  }
}
