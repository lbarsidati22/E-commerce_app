import 'package:injectable/injectable.dart';
import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:Ecommerce/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:Ecommerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:Ecommerce/features/home/domain/entities/cart_entity.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource _remoteDataSource;

  CartRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<CartResponseEntity>> addProductToCart(
    String productId,
  ) async {
    return _remoteDataSource.addProductToCart(productId);
  }

  @override
  Future<ApiResult<CartResponseEntity>> getCart() async {
    return _remoteDataSource.getCart();
  }
}
