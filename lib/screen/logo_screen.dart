import 'dart:io';

import 'package:flutter/material.dart';

class LogoScreen extends StatelessWidget {
   LogoScreen({Key? key}) : super(key: key);
final File file = File("C:/Users/USER/Downloads/TO-DO/Plan&Go.png");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.file(file),
      ),
    );
  }
}
