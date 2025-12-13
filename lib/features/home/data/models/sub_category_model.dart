import 'package:Ecommerce/features/home/domain/entities/sub_category_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sub_category_model.g.dart';

@JsonSerializable()
class SubCategoryModel {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? slug;
  @JsonKey(name: "category")
  final String? categoryId;

  SubCategoryModel({this.id, this.name, this.slug, this.categoryId});

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryModelToJson(this);

  SubCategoryEntity toEntity() =>
      SubCategoryEntity(id: id, name: name, slug: slug, categoryId: categoryId);
}
