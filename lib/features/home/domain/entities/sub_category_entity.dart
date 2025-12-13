import 'package:Ecommerce/features/home/domain/entities/base_nasted_entity.dart';

class SubCategoryEntity extends BaseNestedEntity {
  final String? categoryId;

  const SubCategoryEntity({super.id, super.name, super.slug, this.categoryId});
}
