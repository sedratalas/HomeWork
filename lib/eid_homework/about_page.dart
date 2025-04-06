import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

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
                  child: Icon(Icons.menu, size: 30,),
                ),
              ],
            ),
            Text("About",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text("Meet our company",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: Placeholder(
                fallbackHeight: 150,
                fallbackWidth: 100,
              ),
            ),
            Text("Team",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text("Meet our team!",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black45,
              ),
            ),
            SizedBox(
              height: 400,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2
                  ),
                  itemCount: 10,
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 60,
                        ),
                        Text("Name"),
                        Text("position"),
                      ],
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
