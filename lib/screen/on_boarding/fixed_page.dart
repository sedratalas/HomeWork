import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FixedPage extends StatelessWidget {
   FixedPage({Key? key}) : super(key: key);
   final PageController controller = PageController();
   final File file = File("C:/Users/USER/Downloads/mobile-note-list/cuate.png");
   final File file2 = File("C:/Users/USER/Downloads/mobile-note-list/cuate2.png");
   final File file3 = File("C:/Users/USER/Downloads/mobile-note-list/cuate3.png");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 700,
            child: PageView(
              controller: controller,
              children: [
                Column(
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
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 51, right: 30),
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
                        child: Image.file(file2)
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 90.0, bottom: 33),
                      child: Text("Stay Organized",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text("Group your tasks and keep\nthem organized",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 152, left: 70, right: 70),
                        child: Image.file(file3)
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
                  ],
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 31 ),
            child: SmoothPageIndicator(
                controller: controller,
                count: 3,
              effect: WormEffect(),
              onDotClicked: (index) {},
            ),
          ),
          InkWell(
            onTap: (){
              controller.nextPage(
                  duration: Duration(seconds: 1),
                  curve: Curves.easeIn
              );
            },
            child: Container(
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
          ),
        ],
      ),
    );
  }
}
