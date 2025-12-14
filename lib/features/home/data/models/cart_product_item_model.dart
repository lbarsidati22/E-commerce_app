// lib/features/cart/data/models/cart_product_item_model.dart
import 'package:Ecommerce/features/home/data/models/cart_product_details_model.dart';
import 'package:Ecommerce/features/home/domain/entities/cart_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_product_item_model.g.dart';

@JsonSerializable()
class CartProductItemModel {
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "product")
  final CartProductDetailsModel? product;
  @JsonKey(name: "price")
  final int? price;

  CartProductItemModel({this.count, this.id, this.product, this.price});

  factory CartProductItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartProductItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductItemModelToJson(this);

  CartProductItemEntity toEntity() => CartProductItemEntity(
    count: count,
    id: id,
    product: product?.toEntity(),
    price: price,
  );
}
