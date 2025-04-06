import 'package:flutter/material.dart';
import 'package:to_do_app/screen/add_quiz.dart';
import 'package:to_do_app/screen/designed_quiz.dart';
import 'package:to_do_app/screen/logo_screen.dart';
import 'package:to_do_app/screen/on_boarding/on_boarding2.dart';
import 'package:to_do_app/screen/on_boarding/on_boarding3.dart';
import 'package:to_do_app/screen/one_quiz_remote.dart';
import 'package:to_do_app/screen/psiphon.dart';

import 'eid_homework/about_page.dart';
import 'eid_homework/contact_page.dart';
import 'eid_homework/home_page.dart';
import 'eid_homework/splash_page.dart';
import 'screen/on_boarding/on_boarding1.dart';
import 'screen/quiz.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // PageView(
      //   scrollDirection: Axis.horizontal,
      //   physics: BouncingScrollPhysics(),
      //   children: [
      //     OnBoarding1(),
      //     OnBoarding2(),
      //     OnBoarding3(),
      //   ],
      // ),
    );
  }
}
