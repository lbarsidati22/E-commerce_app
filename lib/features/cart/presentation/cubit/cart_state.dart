import 'package:Ecommerce/features/home/domain/entities/cart_entity.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class AddToCartLoading extends CartState {}

class AddToCartSuccess extends CartState {
  final CartResponseEntity cartResponse;
  AddToCartSuccess(this.cartResponse);
}

class AddToCartError extends CartState {
  final String message;
  AddToCartError(this.message);
}

class GetCartLoading extends CartState {}

class GetCartSuccess extends CartState {
  final CartResponseEntity cartResponseEntity;
  GetCartSuccess(this.cartResponseEntity);
}

class GetCartError extends CartState {
  final String message;
  GetCartError(this.message);
}
