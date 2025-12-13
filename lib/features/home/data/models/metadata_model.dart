// lib/features/products/data/models/metadata_model.dart
import 'package:Ecommerce/features/home/domain/entities/metadata_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metadata_model.g.dart';

@JsonSerializable()
class MetadataModel {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "numberOfPages")
  final int? numberOfPages;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "nextPage")
  final int? nextPage;

  MetadataModel({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  factory MetadataModel.fromJson(Map<String, dynamic> json) =>
      _$MetadataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataModelToJson(this);

  MetadataEntity toEntity() => MetadataEntity(
    currentPage: currentPage,
    numberOfPages: numberOfPages,
    limit: limit,
    nextPage: nextPage,
  );
}
