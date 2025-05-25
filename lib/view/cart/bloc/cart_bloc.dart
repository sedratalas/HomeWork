// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../model/remote_cart_model.dart';
import '../../../model/remote_product_model.dart';
import '../../../repositery/product_repository.dart';


part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartModel cart = CartModel(
    prodcuts: [],
    id: 1,
    totalPrice: 0,
  );

  final ProductRepository productRepository;

  CartBloc(this.productRepository) : super(CartInitial()) {
    on<ViewCart>((event, emit) async {
      emit(LoadingCart());
      ResultData data = await productRepository.getCart();

      if (data is CartModel) {
        cart.prodcuts = data.prodcuts;
        cart.calculatePrice();
        emit(CartLoaded(cart: cart));
      } else {
        data as ErrorData;
        print(data.message);
        emit(ErrorToLoad());
      }
    });

    on<IncreasProductQuintity>((event, emit) {
      for (var i = 0; i < cart.prodcuts.length; i++) {
        if (cart.prodcuts[i].id == event.id) {
          cart.prodcuts[i].quintity++;
        }
      }
      cart.calculatePrice();
      emit(CartLoaded(cart: cart));
    });

    on<ViewOneProduct>((event, emit) {
      emit(Productloaded(
          product: cart.prodcuts.firstWhere((element) => element.id == event.id)));
    });

    on<IncreasProductQuintityFromDetails>((event, emit) {
      for (var i = 0; i < cart.prodcuts.length; i++) {
        if (cart.prodcuts[i].id == event.id) {
          cart.prodcuts[i].quintity++;
        }
      }
      cart.calculatePrice();
      emit(Productloaded(
          product: cart.prodcuts.firstWhere((element) => element.id == event.id)));
    });
  }
}
