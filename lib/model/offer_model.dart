

import 'dart:convert';

List<OfferModel> offerModelFromJson(String str) => List<OfferModel>.from(json.decode(str).map((x) => OfferModel.fromJson(x)));

String offerModelToJson(List<OfferModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OfferModel {
  String title;
  String description;
  double price;
  double quantity;
  double volume;
  int id;
  int companyId;
  Company company;

  OfferModel({
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    required this.volume,
    required this.id,
    required this.companyId,
    required this.company,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
    title: json["title"],
    description: json["description"],
    price: json["price"].toDouble(),
    quantity: json["quantity"].toDouble(),
    volume: json["volume"].toDouble(),
    id: json["id"],
    companyId: json["company_id"],
    company: Company.fromJson(json["company"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "price": price,
    "quantity": quantity,
    "volume": volume,
    "id": id,
    "company_id": companyId,
    "company": company.toJson(),
  };
}

class Company {
  String name;
  String description;
  String contactInfo;
  double rating;
  double pricePerLiter;
  int id;

  Company({
    required this.name,
    required this.description,
    required this.contactInfo,
    required this.rating,
    required this.pricePerLiter,
    required this.id,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    name: json["name"],
    description: json["description"],
    contactInfo: json["contact_info"],
    rating: json["rating"].toDouble(),
    pricePerLiter: json["price_per_liter"].toDouble(),
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
