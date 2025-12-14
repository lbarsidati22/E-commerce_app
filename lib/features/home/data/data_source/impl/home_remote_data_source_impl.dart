import 'package:Ecommerce/core/api_layer/api_client/api_client.dart';
import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:Ecommerce/features/home/data/data_source/contract/home_data_source.dart';
import 'package:Ecommerce/features/home/domain/entities/brand_response_entity.dart';
import 'package:Ecommerce/features/home/domain/entities/category_response_entity.dart';
import 'package:Ecommerce/features/home/domain/entities/product_response_entity.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeDataSource)
class HomeRemoteDataSourceImpl implements HomeDataSource {
  ApiClient apiClient;
  HomeRemoteDataSourceImpl(this.apiClient);

  @override
  Future<ApiResult<CategoryResponseEntity>> getAllCategories() async {
    try {
      final response = await apiClient.getAllCategories();

      if (response.data != null) {
        return ApiSuccessResult(response.toEntity());
      }
      return ApiErrorResult("No categories found");
    } catch (e) {
      if (e is DioException) {
        return ApiErrorResult(e.message ?? e.toString());
      }
      return ApiErrorResult(e.toString());
    }
  }

  @override
  Future<ApiResult<ProductsResponseEntity>> getAllProducts({
    String? brandId,
    String? categoryId,
  }) async {
    try {
      final response = await apiClient.getAllProducts(
        brandId: brandId,
        categoryId: categoryId,
      );
      if (response.data != null) {
        return ApiSuccessResult(response.toEntity());
      }
      return ApiErrorResult("No products found");
    } catch (e) {
      if (e is DioException) {
        return ApiErrorResult(e.message ?? e.toString());
      }
      return ApiErrorResult(e.toString());
    }
  }

  @override
  Future<ApiResult<BrandResponseEntity>> getAllBrands() async {
    try {
      final response = await apiClient.getAllBrands();
      if (response.data != null) {
        return ApiSuccessResult(response.toEntity());
      }
      return ApiErrorResult("No brands found");
    } catch (e) {
      if (e is DioException) {
        return ApiErrorResult(e.message ?? e.toString());
      }
      return ApiErrorResult(e.toString());
    }
  }
}
