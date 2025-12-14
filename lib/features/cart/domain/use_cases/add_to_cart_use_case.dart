import 'package:injectable/injectable.dart';
import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:Ecommerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:Ecommerce/features/home/domain/entities/cart_entity.dart';

@injectable
class AddToCartUseCase {
  final CartRepository _cartRepository;

  AddToCartUseCase(this._cartRepository);

  Future<ApiResult<CartResponseEntity>> invoke(String productId) async {
    return await _cartRepository.addProductToCart(productId);
  }
}
