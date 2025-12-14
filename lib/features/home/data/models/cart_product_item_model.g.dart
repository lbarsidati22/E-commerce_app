// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartProductItemModel _$CartProductItemModelFromJson(
  Map<String, dynamic> json,
) => CartProductItemModel(
  count: (json['count'] as num?)?.toInt(),
  id: json['_id'] as String?,
  product: json['product'] == null
      ? null
      : CartProductDetailsModel.fromJson(
          json['product'] as Map<String, dynamic>,
        ),
  price: (json['price'] as num?)?.toInt(),
);

Map<String, dynamic> _$CartProductItemModelToJson(
  CartProductItemModel instance,
) => <String, dynamic>{
  'count': instance.count,
  '_id': instance.id,
  'product': instance.product,
  'price': instance.price,
};
