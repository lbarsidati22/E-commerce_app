import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:Ecommerce/features/home/domain/entities/category_entity.dart';
import 'package:Ecommerce/features/home/domain/entities/category_response_entity.dart';
import 'package:Ecommerce/features/home/domain/entities/product_entity.dart';
import 'package:Ecommerce/features/home/domain/entities/product_response_entity.dart';
import 'package:Ecommerce/features/home/domain/use_case/get_categories_use_case.dart';
import 'package:Ecommerce/features/home/domain/use_case/get_products_use_case.dart';
import 'package:Ecommerce/features/category/presentation/cubit/category_intent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'category_state.dart';

@injectable
class CategoryViewModel extends Cubit<CategoryState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetProductsUseCase _getProductsUseCase;

  CategoryViewModel(this._getCategoriesUseCase, this._getProductsUseCase)
    : super(CategoryInitial());

  void doIntent(CategoryIntent intent) {
    if (intent is LoadCategoryResultIntent) {
      _loadData();
    } else if (intent is SelectCategoryIntent) {
      _selectCategory(intent.categoryId);
    }
  }

  Future<void> _loadData() async {
    emit(CategoryLoading());

    // Load categories
    final categoriesResult = await _getCategoriesUseCase.invoke();
    if (categoriesResult is ApiErrorResult) {
      emit(CategoryError((categoriesResult as ApiErrorResult).errorMessage));
      return;
    }

    // Load initial products (all or filtered? default all maybe?)
    // User wants "same work done on brand select in home with product to happen with category"
    // In Home, initially we show all products.
    final productsResult = await _getProductsUseCase.invoke();

    if (productsResult is ApiErrorResult) {
      emit(CategoryError((productsResult as ApiErrorResult).errorMessage));
      return;
    }

    if (categoriesResult is ApiSuccessResult &&
        productsResult is ApiSuccessResult) {
      final categories =
          (categoriesResult as ApiSuccessResult<CategoryResponseEntity>)
              .data
              .data;
      final products =
          (productsResult as ApiSuccessResult<ProductsResponseEntity>)
              .data
              .data;

      // Filter default? Or just show all?
      // Home page shows all initially.
      emit(
        CategorySuccess(
          categories: categories,
          products: products,
          selectedCategoryId: null,
          isSelectedCategoryIdNull: true,
        ),
      );
    }
  }

  Future<void> _selectCategory(String? categoryId) async {
    final currentState = state;
    if (currentState is CategorySuccess) {
      emit(
        currentState.copyWith(
          selectedCategoryId: categoryId,
          isSelectedCategoryIdNull: categoryId == null,
          isProductsLoading: true,
        ),
      );

      final result = await _getProductsUseCase.invoke(categoryId: categoryId);

      // Check if state is still Success to update products
      if (state is CategorySuccess) {
        final currentSuccessState = state as CategorySuccess;
        if (result is ApiSuccessResult) {
          emit(
            currentSuccessState.copyWith(
              products: (result as ApiSuccessResult<ProductsResponseEntity>)
                  .data
                  .data,
              isProductsLoading: false,
            ),
          );
        } else if (result is ApiErrorResult) {
          // Keep old products or clear?
          // Better to stop loading.
          emit(currentSuccessState.copyWith(isProductsLoading: false));
          // Optionally emit single event error
        }
      }
    }
  }
}
