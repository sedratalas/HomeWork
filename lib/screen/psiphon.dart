import 'dart:io';

import 'package:flutter/material.dart';

class Psiphon extends StatelessWidget {
   Psiphon({Key? key}) : super(key: key);
final File file = File("C:/Users/USER/Downloads/psiphon.png");
final File logo = File("C:/Users/USER/Downloads/logo.png");
final File psi = File("C:/Users/USER/Downloads/psi.png");
final File setting = File("C:/Users/USER/Downloads/setting.png");
final File feed = File("C:/Users/USER/Downloads/feed.png");
final File about = File("C:/Users/USER/Downloads/about.png");
final File logs = File("C:/Users/USER/Downloads/logs.png");
final File lang = File("C:/Users/USER/Downloads/lang.png");
final File psi2 = File("C:/Users/USER/Downloads/psi2.png");
final File psi3 = File("C:/Users/USER/Downloads/psi3.png");
final File psi4 = File("C:/Users/USER/Downloads/psi4.png");
final File pro = File("C:/Users/USER/Downloads/pro.png");
final File tort = File("C:/Users/USER/Downloads/tort.png");
final File graylogo = File("C:/Users/USER/Downloads/graylogo.png");
final File check = File("C:/Users/USER/Downloads/check.png");
final File check2 = File("C:/Users/USER/Downloads/check2.png");
List<String> menu = ["CONNECT","PSICASH","SETTINGS", "FEEDBACK", "ABOUT","LOGS", "LANGUAGE"];
final List <File> icons = [
   File("C:/Users/USER/Downloads/check2.png"),
   File("C:/Users/USER/Downloads/psi.png"),
   File("C:/Users/USER/Downloads/setting.png"),
   File("C:/Users/USER/Downloads/feed.png"),
   File("C:/Users/USER/Downloads/about.png"),
   File("C:/Users/USER/Downloads/logs.png"),
   File("C:/Users/USER/Downloads/lang.png"),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 170,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 5,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color(0xff1A7B9C),
                      ),
                    ),
                    Image.file(logo),
                  ],
                ),
               SizedBox(
                 height: 300,
                 child: ListView.builder(
                     itemCount: menu.length,
                     itemBuilder: (context,index) => ListTile(
                       leading: Image.file(icons[index]),
                       title: Text(menu[index],
                           style: TextStyle(
                             fontWeight: FontWeight.w700,
                         ),
                       ),
                       onTap: () {},
                       mouseCursor: SystemMouseCursors.click,
                       focusColor: Color(0xff1A7B9C),
                       selectedColor: Color(0xff1A7B9C),
                     ),
                 ),
               ),
                Container(
                  width: 175,
                  height: 3,
                  decoration: BoxDecoration(
                    color: Color(0xff1A7B9C),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 5,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color(0xff1A7B9C),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.file(psi2),
                              Text("90",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                              SizedBox(width: 70,),
                              Image.file(pro),
                            ],
                          ),
                        ),
                        _speedComponent(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            spacing: 90,
            children: [
              _buildAppBarComponent(),
              _buildConnectComponent(),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select server region",
                    style: TextStyle(
                      color: Color(0xffBD564E),
                      fontSize: 13,
                    ),
                  ),
                  _buildServerRegionComponent(),
                ]
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget _speedComponent(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 40,
            width: 145,
            decoration: BoxDecoration(
              color: Color(0xffCC664D),
              borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("PSIPHON\nSPEED",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Image.file(tort),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: 145,
            decoration: BoxDecoration(
              color: Color(0xff17627F),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                children: [
                  Text("SPEED BOOST",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("1 hour",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      Image.file(graylogo),
                      Text("1,00",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 145,
            height: 30,
            decoration: BoxDecoration(
              color: Color(0xff3695B5),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Buy PsiCash",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.file(psi3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

 Widget _buildConnectComponent() {
    return Center(
      child: Container(
        width: 540,
        height: 320,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 1.0),
            left: BorderSide(color: Colors.grey.shade300, width: 1.0),
            right: BorderSide(color: Colors.grey.shade300, width: 1.0),
            bottom: BorderSide(color: Colors.grey.shade300, width: 1.0),

          ),
        ),
        child: Column(
          children: [
            Image.file(check),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("PSIPHON IS",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                  ),
                ),
                Text(" CONNECTED",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(".  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  ."),
            ),
            Container(
              width: 230,
              height: 45,
              decoration: BoxDecoration(
                color: Color(0xffBD564E),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  "DISCONNECT",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
 }

  Widget _buildServerRegionComponent() {
    return Container(
      width: 230,
      height:35 ,
      decoration: BoxDecoration(
        border:  Border(
          top: BorderSide(color: Color(0xff9EAFA9), width: 1.0),
          left: BorderSide(color: Color(0xff9EAFA9), width: 1.0),
          right: BorderSide(color: Color(0xff9EAFA9), width: 1.0),
          bottom: BorderSide(color: Color(0xff9EAFA9), width: 1.0),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.file(psi4),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text("Best Performance",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border(
                  top: BorderSide(color: Colors.black, width: 1.0),
                  left: BorderSide(color: Colors.black, width: 1.0),
                  right: BorderSide(color: Colors.black, width: 1.0),
                  bottom: BorderSide(color: Colors.black, width: 1.0),
                ),
              ),
              child: Center(child: Icon(Icons.keyboard_arrow_up)),
            ),
          ),
        ],
      ),
    );
  }

 Widget _buildAppBarComponent() {
    return Container(
      width: 730,
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xff1A7B9C),
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text("Sponsored by",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w100,
              ),
            ),
            Image.file(file),
          ],
        ),
      ),
    );
  }
}
/* Row(
                  children: [
                    Container(
                      width: 5,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Color(0xffB7DFDB),
                      ),
                    ),
                    Container(
                      width: 165,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Color(0xff1A7B9C),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: [
                            Image.file(check2),
                            Text("CONNECTED",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 5,
                      height: 290,
                      decoration: BoxDecoration(
                        color: Color(0xff1A7B9C),
                      ),
                    ),
                    Column(
                      spacing: 18,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              Image.file(psi),
                              Text("PSICASH",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Image.file(setting),
                            Text("SETTINGS",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.file(feed),
                            Text("FEEDBACK",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.file(about),
                            Text("ABOUT",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.file(logs),
                            Text("LOGS",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.file(lang),
                            Text("LANGUAGE",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40,),

                      ],
                    ),
                  ],
                ),*/