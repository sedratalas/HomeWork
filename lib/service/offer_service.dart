import 'package:dio/dio.dart';
import 'package:zamzam_app/model/offer_model.dart';

import '../model/company_model.dart';

class OfferService{

  Dio dio;
  OfferService({required this.dio});

  late Response response;
  String baseUrl = "https://zamzaam.onrender.com/";

  Future<List<CompanyModel>> getAllCompanies() async {
    try {
      final response = await dio.get("${baseUrl}companies/");
      print("Companies response: ${response.data}");

      return List<CompanyModel>.from(
        response.data.map((x) => CompanyModel.fromJson(x)),
      );
    } catch (e) {
      print("Error fetching companies: $e");
      return [];
    }
  }

  Future<List<OfferModel>> getAllOffer()async{
    try{
      response = await dio.get(baseUrl+"offers/");
      List<OfferModel> offers = [];
      for (var i = 0; i < response.data.length; i++) {
        offers.add(OfferModel.fromJson(response.data[i]));
      }

      print(response.data);
      return offers;
    }catch(e){
      print("Error fetching offers: $e");
      return [];
    }
}

  Future<List<OfferModel>> getOffersByCompanyId(int companyId) async {
    try {
      final response = await dio.get("${baseUrl}companies/$companyId/offers/");
      print("Offers for company $companyId: ${response.data}");

      return List<OfferModel>.from(
        response.data.map((x) => OfferModel.fromJson(x)),
      );
    } catch (e) {
      print("Error fetching offers for company $companyId: $e");
      return [];
    }
  }

}