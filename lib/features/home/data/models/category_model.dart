// lib/features/products/data/models/nested/category_model.dart
import 'package:Ecommerce/features/home/domain/entities/category_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  CategoryModel({this.id, this.name, this.slug, this.image});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  CategoryEntity toEntity() =>
      CategoryEntity(id: id, name: name, slug: slug, image: image);
}
