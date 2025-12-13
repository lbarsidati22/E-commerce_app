import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:Ecommerce/features/home/domain/entities/brand_response_entity.dart';
import 'package:Ecommerce/features/home/domain/entities/product_response_entity.dart';
import 'package:Ecommerce/features/home/domain/use_case/get_brands_use_case.dart';
import 'package:Ecommerce/features/home/domain/use_case/get_products_use_case.dart';
import 'package:Ecommerce/features/home/presentation/cubit/home_intent.dart';
import 'package:Ecommerce/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeState> {
  final GetProductsUseCase _getProductsUseCase;
  final GetBrandsUseCase _getBrandsUseCase;

  HomeViewModel(this._getProductsUseCase, this._getBrandsUseCase)
    : super(HomeInitial());

  void doIntent(HomeIntent intent) {
    switch (intent) {
      case LoadProductsIntent():
        _loadProducts();
        break;
      case LoadHomeDataIntent():
        _loadHomeData();
        break;
      case SelectBrandIntent():
        _selectBrand(intent.brandId);
        break;
    }
  }

  Future<void> _selectBrand(String? brandId) async {
    final currentState = state;
    if (currentState is HomeSuccess) {
      // Optimistically update UI selection
      emit(
        currentState.copyWith(
          selectedBrandId: brandId,
          isSelectedBrandIdNull: brandId == null,
        ),
      );
    }
    await _loadProducts(brandId: brandId);
  }

  Future<void> _loadProducts({String? brandId}) async {
    // If we are already in Success state, update logic to avoid UI flickering
    if (state is HomeSuccess) {
      emit((state as HomeSuccess).copyWith(isProductsLoading: true));
    } else {
      // Fallback for initial load if not coming from loadHomeData (unlikely)
      emit(HomeLoading());
    }

    final result = await _getProductsUseCase.invoke(brandId: brandId);

    // Check if we are still in success state to use copyWith, or re-create
    if (state is HomeSuccess) {
      final currentState = state as HomeSuccess;
      switch (result) {
        case ApiSuccessResult():
          emit(
            currentState.copyWith(
              products: result.data.data,
              isProductsLoading: false,
            ),
          );
          break;
        case ApiErrorResult():
          // For now, if product load fails, we might just stop loading and show snackbar?
          // Or emit HomeError? Emitting HomeError wipes the screen.
          // Better to just stop loading and maybe show a toast (UI side).
          // But for now, let's just stop loading to avoid stuck spinner.
          emit(currentState.copyWith(isProductsLoading: false));
          // emit(HomeError(result.errorMessage)); // This would wipe the screen
          break;
      }
    } else {
      // Fallback
      switch (result) {
        case ApiSuccessResult():
          emit(HomeSuccess(products: result.data.data));
          break;
        case ApiErrorResult():
          emit(HomeError(result.errorMessage));
          break;
      }
    }
  }

  Future<void> _loadHomeData() async {
    emit(HomeLoading());
    // Run all requests in parallel
    final results = await Future.wait([
      _getProductsUseCase.invoke(),
      _getBrandsUseCase.invoke(),
    ]);

    final productsResult = results[0];
    final brandsResult = results[1];

    if (productsResult is ApiErrorResult) {
      emit(HomeError((productsResult as ApiErrorResult).errorMessage));
      return;
    }
    if (brandsResult is ApiErrorResult) {
      emit(HomeError((brandsResult as ApiErrorResult).errorMessage));
      return;
    }

    if (productsResult is ApiSuccessResult &&
        brandsResult is ApiSuccessResult) {
      final prodEntity =
          (productsResult as ApiSuccessResult).data as ProductsResponseEntity;
      final brandEntity =
          (brandsResult as ApiSuccessResult).data as BrandResponseEntity;

      emit(HomeSuccess(products: prodEntity.data, brands: brandEntity.data));
    }
  }
}
