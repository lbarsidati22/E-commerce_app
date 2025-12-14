// lib/features/cart/data/models/cart_response_model.dart
import 'package:Ecommerce/features/home/data/models/cart_data_model.dart';
import 'package:Ecommerce/features/home/domain/entities/cart_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_response_model.g.dart';

@JsonSerializable()
class CartResponseModel {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "numOfCartItems")
  final int? numOfCartItems;
  @JsonKey(name: "cartId")
  final String? cartId;
  @JsonKey(name: "data")
  final CartDataModel? data;

  CartResponseModel({this.status, this.numOfCartItems, this.cartId, this.data});

  factory CartResponseModel.fromJson(Map<String, dynamic> json) {
    return _$CartResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartResponseModelToJson(this);
  }

  CartResponseEntity toEntity() {
    return CartResponseEntity(
      status: status,
      numOfCartItems: numOfCartItems,
      cartId: cartId,
      data: data?.toEntity(),
    );
  }
}
