import 'package:Ecommerce/features/home/domain/entities/brand_entity.dart';
import 'package:Ecommerce/features/home/domain/entities/category_entity.dart';
import 'package:Ecommerce/features/home/domain/entities/sub_category_entity.dart';

class ProductEntity {
  final int? sold;
  final List<String>? images;
  final List<SubCategoryEntity>? subcategory;
  final int? ratingsQuantity;
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final num? price;
  final num? priceAfterDiscount;
  final String? imageCover;
  final CategoryEntity? category;
  final BrandEntity? brand;
  final num? ratingsAverage;
  final String? createdAt;
  final String? updatedAt;

  const ProductEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.priceAfterDiscount,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });
}
