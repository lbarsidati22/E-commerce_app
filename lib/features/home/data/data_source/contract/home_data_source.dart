import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:Ecommerce/features/home/data/models/category_response_model.dart';
import 'package:Ecommerce/features/home/data/models/products_response_model.dart';

abstract class HomeDataSource {
  Future<ApiResult<ProductsResponseModel>> getAllProducts();
  Future<ApiResult<CategoryResponseModel>> getAllCategories();
}
