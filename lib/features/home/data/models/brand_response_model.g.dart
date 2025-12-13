// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandResponseModel _$BrandResponseModelFromJson(Map<String, dynamic> json) =>
    BrandResponseModel(
      results: (json['results'] as num?)?.toInt(),
      metadata: json['metadata'] == null
          ? null
          : MetadataModel.fromJson(json['metadata'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BrandModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BrandResponseModelToJson(BrandResponseModel instance) =>
    <String, dynamic>{
      'results': instance.results,
      'metadata': instance.metadata,
      'data': instance.data,
    };
