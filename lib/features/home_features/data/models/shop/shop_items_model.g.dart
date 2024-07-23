// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopItemModel _$ShopItemModelFromJson(Map<String, dynamic> json) =>
    ShopItemModel(
      json['productNameArabic'] as String,
      json['productNameEnglish'] as String,
      (json['price'] as num).toInt(),
      json['content'] as String,
      json['describtion'] as String,
      json['createdDate'] as String,
      json['image1'] as String,
      json['image2'] as String,
      json['image3'] as String,
      (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$ShopItemModelToJson(ShopItemModel instance) =>
    <String, dynamic>{
      'productNameArabic': instance.productNameArabic,
      'productNameEnglish': instance.productNameEnglish,
      'price': instance.price,
      'content': instance.content,
      'describtion': instance.describtion,
      'createdDate': instance.createdDate,
      'image1': instance.image1,
      'image2': instance.image2,
      'image3': instance.image3,
      'quantity': instance.quantity,
    };
