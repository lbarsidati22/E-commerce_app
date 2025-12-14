import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:Ecommerce/features/cart/domain/use_cases/add_to_cart_use_case.dart';
import 'package:Ecommerce/features/cart/domain/use_cases/get_cart_use_case.dart';
import 'package:Ecommerce/features/cart/presentation/cubit/cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final AddToCartUseCase _addToCartUseCase;
  final GetCartUseCase _getCartUseCase;

  CartCubit(this._addToCartUseCase, this._getCartUseCase)
    : super(CartInitial());

  Future<void> addProductToCart(String productId) async {
    emit(AddToCartLoading());
    final result = await _addToCartUseCase.invoke(productId);

    switch (result) {
      case ApiSuccessResult():
        emit(AddToCartSuccess(result.data));
        break;
      case ApiErrorResult():
        emit(AddToCartError(result.errorMessage));
        break;
    }
  }

  Future<void> getCart() async {
    emit(GetCartLoading());
    final result = await _getCartUseCase.invoke();

    switch (result) {
      case ApiSuccessResult():
        emit(GetCartSuccess(result.data));
        break;
      case ApiErrorResult():
        emit(GetCartError(result.errorMessage));
        break;
    }
  }
}
