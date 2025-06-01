import 'package:equatable/equatable.dart';
import 'package:zamzam_app/model/company_model.dart';
import 'package:zamzam_app/model/offer_model.dart';

abstract class OfferState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OfferInitial extends OfferState {}

class OfferLoading extends OfferState {}

class OfferLoaded extends OfferState {
  final List<CompanyModel> companies;
  final List<OfferModel> offers;
  final int? selectedCompanyId;

  OfferLoaded({
    required this.companies,
    required this.offers,
    required this.selectedCompanyId,
  });

  @override
  List<Object?> get props => [companies, offers, selectedCompanyId];
}

class OfferError extends OfferState {
  final String message;

  OfferError({required this.message});

  @override
  List<Object?> get props => [message];
}
