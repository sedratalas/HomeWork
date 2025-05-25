// lib/repository/product_repository.dart
import '../model/remote_cart_model.dart';
import '../service/product_service.dart';

class ProductRepository {
  final ProductService productService;

  CartModel? _cachedCart;

  ProductRepository({required this.productService});

  Future<ResultData> getCart() async {
    if (_cachedCart == null) {
      try {
        print("Fetching from network");
        final result = await productService.getCart();
        _cachedCart = result;
        return result;
      } catch (e) {
        return ErrorData(message: e.toString());
      }
    } else {
      print("Fetching from cache");
      return _cachedCart!;
    }
  }
}
