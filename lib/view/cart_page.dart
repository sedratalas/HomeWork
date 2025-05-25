// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../provider/cart_provider.dart';
//
// class CartPage extends StatelessWidget {
//   const CartPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CartManager>(
//       builder: (context, cartManager, child) => Scaffold(
//         appBar: AppBar(title: const Text('Cart Page')),
//         body: ListView.separated(
//           itemCount: cartManager.carts.length,
//           separatorBuilder: (_, __) => const Divider(thickness: 2),
//           itemBuilder: (context, cartIndex) {
//             final cart = cartManager.carts[cartIndex];
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ListTile(
//                   title: Text("Cart: ${cart.id}"),
//                   subtitle: Text("Total: ${cartManager.getCartTotal(cart)}"),
//                 ),
//                 ...cart.products.map(
//                       (product) => ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor: Color(0xffCFAFB0),
//                       child: Text(product.quantity.toString()),
//                     ),
//                     title: Text(product.name),
//                     subtitle: Text("${product.price}"),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }