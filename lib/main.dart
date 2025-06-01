import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zamzam_app/repositery/auth_repositery.dart';
import 'package:zamzam_app/service/auth_service.dart';

import 'app.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // if (kDebugMode) {
  //   final authRepo = AuthRepository(authService: AuthService(dio: Dio()));
  //   await authRepo.clearUserData();
  // }
  runApp(
    DevicePreview(
        enabled: !kReleaseMode,
        builder: (BuildContext context) => ProviderScope(child: MyApp())) ,

  );
}
