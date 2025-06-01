import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zamzam_app/model/company_model.dart';
import 'package:zamzam_app/model/offer_model.dart';
import 'package:zamzam_app/repositery/offer_repository.dart';

import 'offer_event.dart';
import 'offer_state.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  final OfferRepository offerRepository;

  OfferBloc({required this.offerRepository}) : super(OfferInitial()) {
    on<LoadCompaniesAndOffers>((event, emit) async {
      emit(OfferLoading());
      try {
        final companies = await offerRepository.getAllCompanies();
        final offers = await offerRepository.getAllOffers();
        emit(OfferLoaded(
            companies: companies, offers: offers, selectedCompanyId: null));
      } catch (e) {
        emit(OfferError(message: 'Failed to load data'));
      }
    });

    on<FilterOffersByCompany>((event, emit) async {
      emit(OfferLoading());
      try {
        List<OfferModel> offers;
        if (event.companyId == null) {
          offers = await offerRepository.getAllOffers();
        } else {
          offers = await offerRepository.getOffersByCompanyId(event.companyId!);
        }

        final companies = await offerRepository.getAllCompanies();
        emit(OfferLoaded(
            companies: companies,
            offers: offers,
            selectedCompanyId: event.companyId));
      } catch (e) {
        emit(OfferError(message: 'Failed to load offers'));
      }
    });
  }
}
