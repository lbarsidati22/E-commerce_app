import 'package:injectable/injectable.dart';
import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:Ecommerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:Ecommerce/features/home/domain/entities/cart_entity.dart';

@injectable
class GetCartUseCase {
  final CartRepository _cartRepository;

  GetCartUseCase(this._cartRepository);

  Future<ApiResult<CartResponseEntity>> invoke() async {
    return await _cartRepository.getCart();
  }
}
