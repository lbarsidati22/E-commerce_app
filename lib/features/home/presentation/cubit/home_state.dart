import 'package:Ecommerce/features/home/domain/entities/brand_entity.dart';
import 'package:Ecommerce/features/home/domain/entities/category_entity.dart';
import 'package:Ecommerce/features/home/domain/entities/product_entity.dart';

sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<CategoryEntity>? categories;
  final List<ProductEntity>? products;
  final List<BrandEntity>? brands;
  final String? selectedBrandId;
  final bool isProductsLoading;

  HomeSuccess({
    this.categories,
    this.products,
    this.brands,
    this.selectedBrandId,
    this.isProductsLoading = false,
  });

  HomeSuccess copyWith({
    List<CategoryEntity>? categories,
    List<ProductEntity>? products,
    List<BrandEntity>? brands,
    String? selectedBrandId,
    bool isSelectedBrandIdNull = false, // Flag to explicitly set null
    bool? isProductsLoading,
  }) {
    return HomeSuccess(
      categories: categories ?? this.categories,
      products: products ?? this.products,
      brands: brands ?? this.brands,
      selectedBrandId: isSelectedBrandIdNull
          ? null
          : (selectedBrandId ?? this.selectedBrandId),
      isProductsLoading: isProductsLoading ?? this.isProductsLoading,
    );
  }
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
