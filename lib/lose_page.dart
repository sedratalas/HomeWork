import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LosePage extends StatelessWidget {
  LosePage({super.key});

  bool isPlatformOnBrowser = kIsWeb;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, boxSize) {
            // if (isPlatformOnBrowser) {
            //   return CircularProgressIndicator();
            // } else {
            return Text(
              "Sorry you are Loser ${boxSize.maxWidth}",
              style: TextStyle(fontSize: 40),
            );
            // }
          },
        ),
      ),
    );
  }
}