abstract class OnBoardingEvent {}

class OnBoardingNextPressed extends OnBoardingEvent {}

class OnBoardingPageChanged extends OnBoardingEvent {
  final int currentPage;
  OnBoardingPageChanged({required this.currentPage});
}
