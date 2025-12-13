import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:Ecommerce/features/home/domain/entities/brand_response_entity.dart';
import 'package:Ecommerce/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBrandsUseCase {
  final HomeRepo _homeRepo;

  GetBrandsUseCase(this._homeRepo);

  Future<ApiResult<BrandResponseEntity>> invoke() {
    return _homeRepo.getAllBrands();
  }
}
