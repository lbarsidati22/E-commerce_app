import 'package:Ecommerce/features/home/domain/entities/brand_entity.dart';
import 'package:Ecommerce/features/home/domain/entities/metadata_entity.dart';

class BrandResponseEntity {
  final int? results;
  final MetadataEntity? metadata;
  final List<BrandEntity>? data;

  const BrandResponseEntity({this.results, this.metadata, this.data});
}
