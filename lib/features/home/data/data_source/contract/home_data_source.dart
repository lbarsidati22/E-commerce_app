import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:Ecommerce/features/home/domain/entities/brand_response_entity.dart';
import 'package:Ecommerce/features/home/domain/entities/category_response_entity.dart';
import 'package:Ecommerce/features/home/domain/entities/product_response_entity.dart';

abstract class HomeDataSource {
  Future<ApiResult<ProductsResponseEntity>> getAllProducts({
    String? brandId,
    String? categoryId,
  });
  Future<ApiResult<CategoryResponseEntity>> getAllCategories();
  Future<ApiResult<BrandResponseEntity>> getAllBrands();
}
