// import 'package:flutter/material.dart';
// import '../model/cart_model.dart';
// import '../model/product_model.dart';
//
// class CartManager extends ChangeNotifier {
//   List<CartModel> carts = [];
//
//   void updateCart(ProductModel product) {
//     CartModel? existingCart;
//
//     try {
//       existingCart = carts.firstWhere((cart) => cart.restaurantId == product.restaurantId);
//     } catch (e) {
//       existingCart = null;
//     }
//
//     if (existingCart != null) {
//       int index = existingCart.products.indexWhere((p) => p.id == product.id);
//       if (index != -1) {
//         existingCart.products[index].quantity++;
//       } else {
//         existingCart.products.add(product);
//       }
//     } else {
//       carts.add(
//         CartModel(
//           id: carts.length + 1,
//           restaurantId: product.restaurantId,
//           products: [product],
//         ),
//       );
//     }
//
//     notifyListeners();
//   }
//
//   double getCartTotal(CartModel cart) {
//     double total = 0;
//     for (var p in cart.products) {
//       total += p.price * p.quantity;
//     }
//     return total;
//   }
// }