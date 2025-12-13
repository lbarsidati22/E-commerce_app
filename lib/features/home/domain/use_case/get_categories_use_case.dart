import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:Ecommerce/features/home/domain/entities/category_response_entity.dart';
import 'package:Ecommerce/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase {
  final HomeRepo _homeRepo;

  GetCategoriesUseCase(this._homeRepo);

  Future<ApiResult<CategoryResponseEntity>> invoke() {
    return _homeRepo.getAllCategories();
  }
}
