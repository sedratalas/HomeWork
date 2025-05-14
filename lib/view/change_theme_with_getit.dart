import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intro_to_state_managment/manager/theme_manager.dart';

class ChangeThemeWithGetit extends StatelessWidget {
  const ChangeThemeWithGetit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: GetIt.instance.get<ThemeManager>().isDark,
        builder: (context, value, child){
          return  MaterialApp(
            darkTheme: ThemeData(scaffoldBackgroundColor: Colors.black),
            theme: ThemeData(scaffoldBackgroundColor: Colors.white),
            themeMode: value ? ThemeMode.dark : ThemeMode.light,
            home: ProductPage(),
          );
        }
    );
  }
}
class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        GetIt.instance.get<ThemeManager>().changeTheme();
      }),
    );
  }
}