import 'package:equatable/equatable.dart';

abstract class OfferEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCompaniesAndOffers extends OfferEvent {}

class FilterOffersByCompany extends OfferEvent {
  final int? companyId;

  FilterOffersByCompany({this.companyId});

  @override
  List<Object?> get props => [companyId];
}
