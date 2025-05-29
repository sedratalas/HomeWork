abstract class OnBoardingState {}

class OnBoardingInitial extends OnBoardingState {
  final int currentPage;
  final bool isLastPage;

  OnBoardingInitial({required this.currentPage, required this.isLastPage});
}
