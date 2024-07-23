// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageModel _$PackageModelFromJson(Map<String, dynamic> json) => PackageModel(
      (json['id'] as num).toInt(),
      json['title'] as String,
      (json['validityDay'] as num).toInt(),
      (json['featuredAds'] as num).toInt(),
      (json['price'] as num).toInt(),
      json['sections'] as String,
    );

Map<String, dynamic> _$PackageModelToJson(PackageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'validityDay': instance.validityDay,
      'featuredAds': instance.featuredAds,
      'price': instance.price,
      'sections': instance.sections,
    };
