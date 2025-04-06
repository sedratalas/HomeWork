import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.person_pin, size: 30,),
                ),
              ],
            ),
            Text("Logo",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Home",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("About",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Contact",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
           SizedBox(height: 50),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               width: 150,
               height: 40,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(3),
                 color: Color(0xff2D2E33),
               ),
               child: Center(
                 child: Text("Log in",
                   style: TextStyle(
                     color: Colors.white,
                   ),
                 ),
               ),
             ),
           ),
            SizedBox(
              width: 150,
              height: 40,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  maximumSize: Size(200, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
              ),
                  onPressed: (){
                  },
                  child: Text("Sign up")
              ),
            ),

          ],
        ),
      ),
    );
  }
}
