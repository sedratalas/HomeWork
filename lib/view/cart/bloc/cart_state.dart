part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {
@override
List<Object?> get props => [];
}

class CartLoaded extends CartState {
CartModel cart;
CartLoaded({required this.cart});

@override
List<Object?> get props => [cart.prodcuts.first.quintity];
}

class ErrorToLoad extends CartState {
@override
List<Object?> get props => [];
}

class Productloaded extends CartState {
ProductModel product;
Productloaded({required this.product});

@override
List<Object?> get props => [product.quintity];
}

class LoadingCart extends CartState {
@override
List<Object?> get props => [];
}
