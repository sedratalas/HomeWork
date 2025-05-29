import 'package:flutter_bloc/flutter_bloc.dart';

import 'on_boarding_event.dart';
import 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final int totalPages;

  OnBoardingBloc({required this.totalPages})
      : super(OnBoardingInitial(currentPage: 0, isLastPage: false)) {

    on<OnBoardingNextPressed>((event, emit) {
      final current = (state as OnBoardingInitial).currentPage;
      final newPage = current + 1;
      emit(OnBoardingInitial(
        currentPage: newPage,
        isLastPage: newPage == totalPages - 1,
      ));
    });

    on<OnBoardingPageChanged>((event, emit) {
      emit(OnBoardingInitial(
        currentPage: event.currentPage,
        isLastPage: event.currentPage == totalPages - 1,
      ));
    });
  }
}
