import 'package:Ecommerce/core/api_layer/api_client/api_client.dart';
import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:Ecommerce/features/home/data/data_source/contract/home_data_source.dart';
import 'package:Ecommerce/features/home/data/models/category_response_model.dart';
import 'package:Ecommerce/features/home/data/models/products_response_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeDataSource)
class HomeRemoteDataSourceImpl implements HomeDataSource {
  ApiClient apiClient;
  HomeRemoteDataSourceImpl(this.apiClient);
  @override
  Future<ApiResult<CategoryResponseModel>> getAllCategories() {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<ProductsResponseModel>> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }
}
