import 'package:Ecommerce/features/home/domain/entities/metadata_entity.dart';
import 'package:Ecommerce/features/home/domain/entities/product_entity.dart';

class ProductsResponseEntity {
  final int? results;
  final MetadataEntity? metadata;
  final List<ProductEntity>? data;

  const ProductsResponseEntity({this.results, this.metadata, this.data});
}
