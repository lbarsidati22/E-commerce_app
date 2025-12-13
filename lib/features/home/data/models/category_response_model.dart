import 'package:Ecommerce/features/home/data/models/category_model.dart';
import 'package:Ecommerce/features/home/data/models/metadata_model.dart';
import 'package:Ecommerce/features/home/domain/entities/category_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_response_model.g.dart';

@JsonSerializable()
class CategoryResponseModel {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final MetadataModel? metadata;
  @JsonKey(name: "data")
  final List<CategoryModel>? data;

  CategoryResponseModel({this.results, this.metadata, this.data});

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return _$CategoryResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoryResponseModelToJson(this);
  }

  CategoryResponseEntity toEntity() {
    return CategoryResponseEntity(
      results: results,
      metadata: metadata?.toEntity(),
      data: data?.map((e) => e.toEntity()).toList(),
    );
  }
}
