// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_package_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicePackageModel _$ServicePackageModelFromJson(Map<String, dynamic> json) =>
    ServicePackageModel(
      (json['id'] as num).toInt(),
      json['title'] as String,
      (json['validityDay'] as num).toInt(),
      (json['featuredAds'] as num).toInt(),
      (json['price'] as num).toInt(),
      json['sections'] as String,
    );

Map<String, dynamic> _$ServicePackageModelToJson(
        ServicePackageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'validityDay': instance.validityDay,
      'featuredAds': instance.featuredAds,
      'price': instance.price,
      'sections': instance.sections,
    };
