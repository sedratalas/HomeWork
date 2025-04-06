import 'dart:io';

import 'package:flutter/material.dart';

class OnBoarding3 extends StatelessWidget {
  OnBoarding3({super.key});
  final File file = File("C:/Users/USER/Downloads/mobile-note-list/cuate3.png");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 152, left: 70, right: 70),
              child: Image.file(file)
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90.0, bottom: 33),
            child: Text("Check Progress",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          Text("See how much you have\ndone from your tasks",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w200,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 31 ),
            child: Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xff8BA8B5),
                      shape: BoxShape.circle
                  ),
                  width: 10,
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xff8BA8B5),
                      shape: BoxShape.circle
                  ),
                  width: 10,
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle
                  ),
                  width: 10,
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xff8BA8B5),
              borderRadius: BorderRadius.circular(20),
            ),
            width: 317,
            height: 54,
            child: Center(
              child: Text("Let’s Start",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
