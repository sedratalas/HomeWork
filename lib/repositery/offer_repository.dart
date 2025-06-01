import 'package:zamzam_app/model/company_model.dart';
import 'package:zamzam_app/model/offer_model.dart';
import 'package:zamzam_app/service/offer_service.dart';

class OfferRepository {
  final OfferService offerService;

  OfferRepository({required this.offerService});

  Future<List<CompanyModel>> getAllCompanies() => offerService.getAllCompanies();

  Future<List<OfferModel>> getAllOffers() => offerService.getAllOffer();

  Future<List<OfferModel>> getOffersByCompanyId(int companyId) =>
      offerService.getOffersByCompanyId(companyId);
}
