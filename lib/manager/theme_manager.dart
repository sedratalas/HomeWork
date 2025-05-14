import 'package:flutter/cupertino.dart';

class ThemeManager extends ChangeNotifier{
  ValueNotifier<bool> isDark = ValueNotifier(false);
  changeTheme(){
    isDark.value =!isDark.value;
    notifyListeners();
  }
}