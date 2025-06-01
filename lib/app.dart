
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zamzam_app/app/bloc/auth_bloc.dart';
import 'package:zamzam_app/presentation/view/home_screen/bloc/offer_bloc.dart';
import 'package:zamzam_app/presentation/view/home_screen/bloc/offer_event.dart';
import 'package:zamzam_app/presentation/view/home_screen/home_screen.dart';
import 'package:zamzam_app/presentation/view/login/bloc/login_bloc.dart';
import 'package:zamzam_app/presentation/view/on_boarding/on_boarding_screen.dart';
import 'package:zamzam_app/presentation/view/signup/bloc/signup_bloc.dart';
import 'package:zamzam_app/repositery/auth_repositery.dart';
import 'package:zamzam_app/repositery/offer_repository.dart';
import 'package:zamzam_app/service/auth_service.dart';
import 'package:zamzam_app/service/offer_service.dart';
import 'presentation/view/login/login_screen.dart';
import 'presentation/view/signup/signup_screen.dart';
import 'presentation/view/splash_page.dart';

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final authRepository = AuthRepository(
    authService: AuthService(dio: Dio()),
  );
  final offerRepository = OfferRepository(
      offerService: OfferService(dio: Dio())
  );
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(create: (context)=> AuthBloc()),
            BlocProvider<LoginBloc>(create: (context)=> LoginBloc(authRepository: authRepository)),
            //BlocProvider<OfferBloc>(create: (context)=> OfferBloc(offerRepository: offerRepository)),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: BlocBuilder<AuthBloc,AuthState>(
                builder: (context,state){
                  if (state is UserAuthorized) {
                    return BlocProvider<OfferBloc>(create: (context) => OfferBloc(offerRepository: offerRepository)..add(LoadCompaniesAndOffers()),
                      child: HomeScreen(),
                    );
                  }else {
                    return SplashPage();
                  }
                }
            ),
          )
    );
  }
}
