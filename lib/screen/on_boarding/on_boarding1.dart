import 'dart:io';

import 'package:flutter/material.dart';

class OnBoarding1 extends StatelessWidget {
   OnBoarding1({Key? key}) : super(key: key);
final File file = File("C:/Users/USER/Downloads/mobile-note-list/cuate.png");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Skip",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                ),
                  ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 64, right: 75),
            child: Image.file(file)
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90.0, bottom: 33),
            child: Text("Write Lists",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          Text("Write your tasks in a list and\ncheck them when done!",
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
                      color: Colors.grey,
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
              child: Text("Next",
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
