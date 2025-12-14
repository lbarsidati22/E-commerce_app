import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:Ecommerce/features/home/domain/entities/cart_entity.dart';

abstract class CartRepository {
  Future<ApiResult<CartResponseEntity>> addProductToCart(String productId);
  Future<ApiResult<CartResponseEntity>> getCart();
}
