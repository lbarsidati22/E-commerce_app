// lib/features/cart/data/models/cart_data_model.dart
import 'package:Ecommerce/features/home/data/models/cart_product_item_model.dart';
import 'package:Ecommerce/features/home/domain/entities/cart_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_data_model.g.dart';

@JsonSerializable()
class CartDataModel {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "cartOwner")
  final String? cartOwner;
  @JsonKey(name: "products")
  final List<CartProductItemModel>? products;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "totalCartPrice")
  final int? totalCartPrice;

  CartDataModel({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.totalCartPrice,
  });

  factory CartDataModel.fromJson(Map<String, dynamic> json) =>
      _$CartDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartDataModelToJson(this);

  CartDataEntity toEntity() => CartDataEntity(
    id: id,
    cartOwner: cartOwner,
    products: products?.map((e) => e.toEntity()).toList(),
    createdAt: createdAt,
    updatedAt: updatedAt,
    totalCartPrice: totalCartPrice,
  );
}
