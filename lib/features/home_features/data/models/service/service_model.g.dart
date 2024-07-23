// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
      (json['id'] as num).toInt(),
      json['title'] as String,
      (json['price'] as num).toInt(),
      json['type1'] as String,
      json['type2'] as String,
      json['type3'] as String,
      json['country'] as String,
      json['city'] as String,
      json['createdDate'] as String,
      json['description'] as String,
      json['phoneNumber'] as String,
      (json['countDay'] as num).toInt(),
      (json['countPerson'] as num).toInt(),
      json['fromCountry'] as String,
      json['image1'] as String,
      json['image2'] as String,
      json['image3'] as String,
      json['warranty'] as String,
      json['latitude'] as String,
      json['longitude'] as String,
      json['toCountry'] as String,
      json['whatsAppNumber'] as String,
      json['isApproved'] as bool,
    );

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type3': instance.type3,
      'type2': instance.type2,
      'type1': instance.type1,
      'country': instance.country,
      'city': instance.city,
      'createdDate': instance.createdDate,
      'description': instance.description,
      'price': instance.price,
      'image1': instance.image1,
      'image2': instance.image2,
      'image3': instance.image3,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'phoneNumber': instance.phoneNumber,
      'warranty': instance.warranty,
      'whatsAppNumber': instance.whatsAppNumber,
      'countDay': instance.countDay,
      'countPerson': instance.countPerson,
      'fromCountry': instance.fromCountry,
      'toCountry': instance.toCountry,
      'isApproved': instance.isApproved,
    };
