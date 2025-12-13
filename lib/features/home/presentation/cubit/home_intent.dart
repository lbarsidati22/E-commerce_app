sealed class HomeIntent {}

class LoadProductsIntent extends HomeIntent {}

class LoadHomeDataIntent extends HomeIntent {}

class SelectBrandIntent extends HomeIntent {
  final String? brandId;
  SelectBrandIntent(this.brandId);
}
