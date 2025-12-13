abstract class CategoryIntent {}

class LoadCategoryResultIntent extends CategoryIntent {}

class SelectCategoryIntent extends CategoryIntent {
  final String? categoryId;
  SelectCategoryIntent(this.categoryId);
}
