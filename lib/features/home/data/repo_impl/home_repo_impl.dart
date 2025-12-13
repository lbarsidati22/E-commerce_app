import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:Ecommerce/features/home/data/data_source/contract/home_data_source.dart';
import 'package:Ecommerce/features/home/domain/entities/brand_response_entity.dart';
import 'package:Ecommerce/features/home/domain/entities/category_response_entity.dart';
import 'package:Ecommerce/features/home/domain/entities/product_response_entity.dart';
import 'package:Ecommerce/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeDataSource homeDataSource;
  HomeRepoImpl(this.homeDataSource);

  @override
  Future<ApiResult<CategoryResponseEntity>> getAllCategories() {
    return homeDataSource.getAllCategories();
  }

  @override
  Future<ApiResult<ProductsResponseEntity>> getAllProducts({
    String? brandId,
    String? categoryId,
  }) {
    return homeDataSource.getAllProducts(
      brandId: brandId,
      categoryId: categoryId,
    );
  }

  @override
  Future<ApiResult<BrandResponseEntity>> getAllBrands() {
    return homeDataSource.getAllBrands();
  }
}
