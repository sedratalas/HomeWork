import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zamzam_app/presentation/view/on_boarding/bloc/on_boarding_bloc.dart';

import '../welcome_screen.dart';
import 'bloc/on_boarding_event.dart';
import 'bloc/on_boarding_state.dart';

class OnBoarding1 extends StatefulWidget {
   OnBoarding1({Key? key}) : super(key: key);

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
   PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (_) => OnBoardingBloc(totalPages: 3),
      child: BlocBuilder<OnBoardingBloc, OnBoardingState>(
        builder: (context,state) {
          final bloc = context.read<OnBoardingBloc>();

          if (state is! OnBoardingInitial) return SizedBox();
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 600,
                    child: PageView(
                      controller: controller,
                      onPageChanged: (index) {
                        bloc.add(OnBoardingPageChanged(currentPage: index));
                      },
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/on1.jpg"),
                            Text("We provide best quality water ",
                              style: TextStyle(
                                color: Color(0xff625D5D),
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text("Lorem ipsum dolor sit amet, consectetur\n adipiscing elit, sed ",
                              style: TextStyle(
                                color: Color(0xff625D5D),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/on2.jpg"),
                            Text("We provide best quality water ",
                              style: TextStyle(
                                color: Color(0xff625D5D),
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text("Lorem ipsum dolor sit amet, consectetur\n adipiscing elit, sed ",
                              style: TextStyle(
                                color: Color(0xff625D5D),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/on3.jpg"),
                            Text("We provide best quality water ",
                              style: TextStyle(
                                color: Color(0xff625D5D),
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text("Lorem ipsum dolor sit amet, consectetur\n adipiscing elit, sed ",
                              style: TextStyle(
                                color: Color(0xff625D5D),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 30 ),
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                        activeDotColor: Color(0xff3B3E22),
                        dotWidth: 23,
                        dotHeight: 8,
                      ),
                      onDotClicked: (index) {},
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (state.isLastPage) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => WelcomeScreen()),
                        );
                      } else {
                        bloc.add(OnBoardingNextPressed());
                        controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff3B3E22),
                      ),
                      width: 317,
                      height: 54,
                      child: Center(
                        child: Text(
                          state.isLastPage ? "Get Started" : "Next",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
