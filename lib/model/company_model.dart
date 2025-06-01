import 'dart:convert';

List<CompanyModel> companyModelFromJson(String str) =>
    List<CompanyModel>.from(json.decode(str).map((x) => CompanyModel.fromJson(x)));

String companyModelToJson(List<CompanyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CompanyModel {
  String? name;
  String? description;
  String? contactInfo;
  double? rating;
  double? pricePerLiter;
  int? id;

  CompanyModel({
    this.name,
    this.description,
    this.contactInfo,
    this.rating,
    this.pricePerLiter,
    this.id,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
    name: json["name"],
    description: json["description"],
    contactInfo: json["contact_info"],
    rating: (json["rating"] as num?)?.toDouble(),
    pricePerLiter: (json["price_per_liter"] as num?)?.toDouble(),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "contact_info": contactInfo,
    "rating": rating,
    "price_per_liter": pricePerLiter,
    "id": id,
  };
}
