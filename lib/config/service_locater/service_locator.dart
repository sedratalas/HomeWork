import 'package:get_it/get_it.dart';

import '../../manager/theme_manager.dart';

class ConfigSetup{
  setup(){
    GetIt.instance.registerSingleton<ThemeManager>(ThemeManager());
  }
}