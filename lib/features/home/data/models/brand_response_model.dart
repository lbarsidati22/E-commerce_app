import 'package:Ecommerce/features/home/data/models/brand_model.dart';
import 'package:Ecommerce/features/home/data/models/metadata_model.dart';
import 'package:Ecommerce/features/home/domain/entities/brand_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brand_response_model.g.dart';

@JsonSerializable()
class BrandResponseModel {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final MetadataModel? metadata;
  @JsonKey(name: "data")
  final List<BrandModel>? data;

  BrandResponseModel({this.results, this.metadata, this.data});

  factory BrandResponseModel.fromJson(Map<String, dynamic> json) {
    return _$BrandResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BrandResponseModelToJson(this);
  }

  BrandResponseEntity toEntity() {
    return BrandResponseEntity(
      results: results,
      metadata: metadata?.toEntity(),
      data: data?.map((e) => e.toEntity()).toList(),
    );
  }
}
