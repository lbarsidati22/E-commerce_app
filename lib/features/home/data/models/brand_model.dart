import 'package:Ecommerce/features/home/domain/entities/brand_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brand_model.g.dart';

@JsonSerializable()
class BrandModel {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  BrandModel({this.id, this.name, this.slug, this.image});

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandModelToJson(this);

  BrandEntity toEntity() =>
      BrandEntity(id: id, name: name, slug: slug, image: image);
}
