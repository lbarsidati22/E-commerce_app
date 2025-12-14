// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartProductDetailsModel _$CartProductDetailsModelFromJson(
  Map<String, dynamic> json,
) => CartProductDetailsModel(
  subcategory: (json['subcategory'] as List<dynamic>?)
      ?.map((e) => SubCategoryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  id: json['_id'] as String?,
  title: json['title'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  imageCover: json['imageCover'] as String?,
  category: json['category'] == null
      ? null
      : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
  brand: json['brand'] == null
      ? null
      : BrandModel.fromJson(json['brand'] as Map<String, dynamic>),
  ratingsAverage: json['ratingsAverage'] as num?,
);

Map<String, dynamic> _$CartProductDetailsModelToJson(
  CartProductDetailsModel instance,
) => <String, dynamic>{
  'subcategory': instance.subcategory,
  '_id': instance.id,
  'title': instance.title,
  'quantity': instance.quantity,
  'imageCover': instance.imageCover,
  'category': instance.category,
  'brand': instance.brand,
  'ratingsAverage': instance.ratingsAverage,
};
