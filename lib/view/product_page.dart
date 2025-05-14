import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product_model.dart';
import '../provider/cart_provider.dart';
import 'cart_page.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});
  List<ProductModel> products = [
    ProductModel(id: 1, name: "Banana", price: 2000, restaurantId: 1),
    ProductModel(id: 2, name: "Apple", price: 1000, restaurantId: 1),
    ProductModel(id: 3, name: "Kiwi", price: 3000, restaurantId: 2),
    ProductModel(id: 4, name: "Orange", price: 4000, restaurantId: 3),
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartManager(),
      child: Consumer<CartManager>(
        builder: (context, cart, _) {
          return Scaffold(
            body: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(products[index].name),

                onTap: () {
                  cart.updateCart(products[index]);
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ChangeNotifierProvider.value(
                      value: context.read<CartManager>(),
                      child: CartPage())),
                );
              },
            ),
          );
        },
      ),
    );
  }
}