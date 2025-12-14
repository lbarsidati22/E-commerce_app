// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartDataModel _$CartDataModelFromJson(Map<String, dynamic> json) =>
    CartDataModel(
      id: json['_id'] as String?,
      cartOwner: json['cartOwner'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => CartProductItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      totalCartPrice: (json['totalCartPrice'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CartDataModelToJson(CartDataModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'cartOwner': instance.cartOwner,
      'products': instance.products,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'totalCartPrice': instance.totalCartPrice,
    };
