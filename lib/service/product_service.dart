import 'package:dio/dio.dart';
import '../model/remote_cart_model.dart';

class ProductService {
  Dio requestHandler;
  late Response response;
  String baseurl = "https://6832ce43c3f2222a8cb39a99.mockapi.io/Product";
  ProductService({required this.requestHandler});
  CartModel? cartModel;

  Future<ResultData> getCart() async {
    if (cartModel == null) {
      print("From Network");
      try {
        response = await requestHandler.get(baseurl);
        cartModel = CartModel.fromMap(response.data);
        return cartModel!;
      } catch (e) {
        return ErrorData(message: e.toString());
      }
    } else {
      print("From Cache");
      return cartModel!;
    }
  }
}
