import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:Ecommerce/features/home/domain/entities/category_entity.dart';
import 'package:Ecommerce/features/home/domain/entities/product_response_entity.dart';

abstract class HomeRepo {
  Future<ApiResult<ProductsResponseEntity>> getAllProducts();
  Future<ApiResult<CategoryEntity>> getAllCategories();
}
