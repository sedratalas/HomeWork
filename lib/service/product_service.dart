// lib/service/product_service.dart
import 'package:dio/dio.dart';
import '../model/remote_cart_model.dart';

class ProductService {
  Dio requestHandler;
  late Response response;
  String baseurl = "https://6832ce43c3f2222a8cb39a99.mockapi.io/Product";

  ProductService({required this.requestHandler});

  Future<CartModel> getCart() async {
    response = await requestHandler.get(baseurl);
    return CartModel.fromMap(response.data);
  }
}
