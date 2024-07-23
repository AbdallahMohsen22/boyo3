// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchServiceModel _$SearchServiceModelFromJson(Map<String, dynamic> json) =>
    SearchServiceModel(
      (json['id'] as num).toInt(),
      json['title'] as String,
      (json['price'] as num).toInt(),
      json['type1'] as String,
      json['type2'] as String,
      json['type3'] as String,
      json['country'] as String,
      json['createdDate'] as String,
      json['description'] as String,
      json['phoneNumber'] as String,
      json['image1'] as String,
      json['image2'] as String,
      json['image3'] as String,
      json['warranty'] as String,
      json['latitude'] as String,
      json['longitude'] as String,
      json['whatsAppNumber'] as String,
      json['fullName'] as String,
    );

Map<String, dynamic> _$SearchServiceModelToJson(SearchServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'title': instance.title,
      'description': instance.description,
      'whatsAppNumber': instance.whatsAppNumber,
      'type3': instance.type3,
      'type2': instance.type2,
      'type1': instance.type1,
      'image1': instance.image1,
      'image2': instance.image2,
      'image3': instance.image3,
      'country': instance.country,
      'createdDate': instance.createdDate,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'phoneNumber': instance.phoneNumber,
      'price': instance.price,
      'warranty': instance.warranty,
    };
