// lib/features/products/data/models/products_response_model.dart
import 'package:Ecommerce/features/home/data/models/metadata_model.dart';
import 'package:Ecommerce/features/home/data/models/product_model.dart';
import 'package:Ecommerce/features/home/domain/entities/product_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products_response_model.g.dart';

@JsonSerializable()
class ProductsResponseModel {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final MetadataModel? metadata;
  @JsonKey(name: "data")
  final List<ProductModel>? data;

  ProductsResponseModel({this.results, this.metadata, this.data});

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ProductsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsResponseModelToJson(this);
  }

  ProductsResponseEntity toEntity() {
    return ProductsResponseEntity(
      results: results,
      metadata: metadata?.toEntity(),
      data: data?.map((e) => e.toEntity()).toList(),
    );
  }
}
