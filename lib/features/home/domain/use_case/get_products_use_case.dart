import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:Ecommerce/features/home/domain/entities/product_response_entity.dart';
import 'package:Ecommerce/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase {
  final HomeRepo _homeRepo;

  GetProductsUseCase(this._homeRepo);

  Future<ApiResult<ProductsResponseEntity>> invoke({
    String? brandId,
    String? categoryId,
  }) {
    return _homeRepo.getAllProducts(brandId: brandId, categoryId: categoryId);
  }
}
