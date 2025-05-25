
import 'dart:async';
import 'dart:math';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intro_to_state_managment/view/cart/remote_cart_page.dart';
import 'package:intro_to_state_managment/view/clock_page.dart';
import 'package:intro_to_state_managment/view/comment_page.dart';
import 'package:intro_to_state_managment/view/product_page.dart';

// void main() {
//   runApp(
//       DevicePreview(
//      builder: (context) {
//       return const MyApp();
//     }
//   ));
// }
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CommentPage(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app/bloc/auth_bloc.dart';
import 'auth/bloc/login_bloc.dart';
import 'config.dart';
import 'model/user_model.dart';
import 'view/prev_session.dart';


Future<void> main() async {
  Bloc.observer = MyBlocObserver();  runApp(const App());
  // WidgetsFlutterBinding.ensureInitialized();
  // final storage = await HydratedStorage.build(
  //     storageDirectory: await getApplicationDocumentsDirectory(),
  // );
  //
  // HydratedBlocOverrides.runZoned(
  // () => runApp(const App()),
  // storage: storage,
  // );
  // tickTrick(B());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is UserAuthorized) {
              return CartPage();

            }else {
              return LogInPage();
            }
          },
        ),
      ),
    );
  }
}

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          height: 600,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade200,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: username,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),

              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is FailedToLogin) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Please Try Again")));
                  }
                  if (state is SuccessToLogin) {
                    context.read<AuthBloc>().add(UserSaved());
                  }
                },
                builder: (context, state) {
                  if (state is Loading) {
                    return Container(
                      margin: EdgeInsets.all(20),
                      width: 220,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return InkWell(
                      onTap: () {
                        context.read<LoginBloc>().add(
                          TryLogIn(
                            user: UserModel(
                              usename: username.text,
                              password: password.text,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(20),
                        width: 220,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.orange.shade300,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "Log In",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}