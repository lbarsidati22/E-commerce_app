import 'package:Ecommerce/features/home/domain/entities/base_nasted_entity.dart';

class BrandEntity extends BaseNestedEntity {
  final String? image;

  const BrandEntity({super.id, super.name, super.slug, this.image});
}
