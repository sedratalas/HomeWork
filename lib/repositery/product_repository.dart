// lib/repository/product_repository.dart

import 'package:dio/dio.dart';

import '../service/product_service.dart';


class ProductRepository {
  final ProductService productService;

  ProductRepository({required this.productService});

  Future getCart() {
    return productService.getCart();
  }

// لاحقاً ممكن تضيف getProductById أو updateQuantity هون
}
