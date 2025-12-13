// lib/features/products/data/models/product_model.dart
import 'package:Ecommerce/features/home/data/models/brand_model.dart';
import 'package:Ecommerce/features/home/data/models/category_model.dart';
import 'package:Ecommerce/features/home/data/models/sub_category_model.dart';
import 'package:Ecommerce/features/home/domain/entities/product_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  @JsonKey(name: "sold")
  final num? sold;
  @JsonKey(name: "images")
  final List<String>? images;
  @JsonKey(name: "subcategory")
  final List<SubCategoryModel>? subcategory;
  @JsonKey(name: "ratingsQuantity")
  final int? ratingsQuantity;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "price")
  final num? price;
  @JsonKey(name: "priceAfterDiscount")
  final num? priceAfterDiscount;
  @JsonKey(name: "imageCover")
  final String? imageCover;
  @JsonKey(name: "category")
  final CategoryModel? category;
  @JsonKey(name: "brand")
  final BrandModel? brand;
  @JsonKey(name: "ratingsAverage")
  final num? ratingsAverage;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;

  ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  ProductEntity toEntity() => ProductEntity(
    sold: sold?.toInt(),
    images: images,
    subcategory: subcategory?.map((e) => e.toEntity()).toList(),
    ratingsQuantity: ratingsQuantity,
    id: id,
    title: title,
    slug: slug,
    description: description,
    quantity: quantity,
    price: price,
    priceAfterDiscount: priceAfterDiscount,
    imageCover: imageCover,
    category: category?.toEntity(),
    brand: brand?.toEntity(),
    ratingsAverage: ratingsAverage,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
