part of 'category_view_model.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryError extends CategoryState {
  final String message;
  CategoryError(this.message);
}

class CategorySuccess extends CategoryState {
  final List<CategoryEntity>? categories;
  final List<ProductEntity>? products;
  final String? selectedCategoryId;
  final bool isProductsLoading;
  final bool isSelectedCategoryIdNull;

  CategorySuccess({
    this.categories,
    this.products,
    this.selectedCategoryId,
    this.isProductsLoading = false,
    this.isSelectedCategoryIdNull = false,
  });

  CategorySuccess copyWith({
    List<CategoryEntity>? categories,
    List<ProductEntity>? products,
    String? selectedCategoryId,
    bool? isProductsLoading,
    bool? isSelectedCategoryIdNull,
  }) {
    return CategorySuccess(
      categories: categories ?? this.categories,
      products: products ?? this.products,
      selectedCategoryId: isSelectedCategoryIdNull == true
          ? null
          : selectedCategoryId ?? this.selectedCategoryId,
      isProductsLoading: isProductsLoading ?? this.isProductsLoading,
      isSelectedCategoryIdNull:
          isSelectedCategoryIdNull ?? this.isSelectedCategoryIdNull,
    );
  }
}
