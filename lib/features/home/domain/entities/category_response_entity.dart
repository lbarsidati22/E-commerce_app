import 'package:Ecommerce/features/home/domain/entities/category_entity.dart';
import 'package:Ecommerce/features/home/domain/entities/metadata_entity.dart';

class CategoryResponseEntity {
  final int? results;
  final MetadataEntity? metadata;
  final List<CategoryEntity>? data;

  const CategoryResponseEntity({this.results, this.metadata, this.data});
}
