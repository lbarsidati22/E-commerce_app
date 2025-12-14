// lib/features/cart/data/models/cart_product_details_model.dart

import 'package:Ecommerce/features/home/data/models/brand_model.dart';
import 'package:Ecommerce/features/home/data/models/category_model.dart';
import 'package:Ecommerce/features/home/data/models/sub_category_model.dart';
import 'package:Ecommerce/features/home/domain/entities/cart_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_product_details_model.g.dart';

@JsonSerializable()
class CartProductDetailsModel {
  @JsonKey(name: "subcategory")
  final List<SubCategoryModel>? subcategory;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "imageCover")
  final String? imageCover;
  @JsonKey(name: "category")
  final CategoryModel? category;
  @JsonKey(name: "brand")
  final BrandModel? brand;
  @JsonKey(name: "ratingsAverage")
  final num? ratingsAverage;

  CartProductDetailsModel({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  factory CartProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CartProductDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductDetailsModelToJson(this);

  CartProductDetailsEntity toEntity() => CartProductDetailsEntity(
    subcategory: subcategory?.map((e) => e.toEntity()).toList(),
    id: id,
    title: title,
    quantity: quantity,
    imageCover: imageCover,
    category: category?.toEntity(),
    brand: brand?.toEntity(),
    ratingsAverage: ratingsAverage,
  );
}
