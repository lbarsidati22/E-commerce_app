import 'package:Ecommerce/core/api_layer/api_client/api_client.dart';

import 'package:injectable/injectable.dart';

import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:Ecommerce/features/home/domain/entities/cart_entity.dart';
import 'package:dio/dio.dart';

abstract class CartRemoteDataSource {
  Future<ApiResult<CartResponseEntity>> addProductToCart(String productId);
  Future<ApiResult<CartResponseEntity>> getCart();
}

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiClient _apiClient;

  CartRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<CartResponseEntity>> addProductToCart(
    String productId,
  ) async {
    try {
      final response = await _apiClient.addProductToCart({
        "productId": productId,
      });

      if (response.status == 'success') {
        return ApiSuccessResult(response.toEntity());
      }
      return ApiErrorResult(response.status ?? "Unknown error");
    } catch (e) {
      if (e is DioException) {
        return ApiErrorResult(e.message ?? e.toString());
      }
      return ApiErrorResult(e.toString());
    }
  }

  @override
  Future<ApiResult<CartResponseEntity>> getCart() async {
    try {
      final response = await _apiClient.getCart();

      if (response.status == 'success') {
        return ApiSuccessResult(response.toEntity());
      }

      return ApiErrorResult(response.status ?? "Unknown error");
    } catch (e) {
      if (e is DioException) {
        return ApiErrorResult(e.message ?? e.toString());
      }
      return ApiErrorResult(e.toString());
    }
  }
}
