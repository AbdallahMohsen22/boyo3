import 'package:json_annotation/json_annotation.dart';
part 'shop_items_model.g.dart';

@JsonSerializable()
class ShopItemModel {
  @JsonKey(name: 'productNameArabic')
  String productNameArabic;
  @JsonKey(name: 'productNameEnglish')
  String productNameEnglish;
  @JsonKey(name: 'price')
  int price;
  @JsonKey(name: 'content')
  String content;
  @JsonKey(name: 'describtion')
  String describtion;
  @JsonKey(name: 'createdDate')
  String createdDate;
  @JsonKey(name: 'image1')
  String image1;
  @JsonKey(name: 'image2')
  String image2;
  @JsonKey(name: 'image3')
  String image3;
  @JsonKey(name: 'quantity')
  int quantity;
  ShopItemModel(
      this.productNameArabic,
      this.productNameEnglish,
      this.price,
      this.content,
      this.describtion,
      this.createdDate,
      this.image1,
      this.image2,
      this.image3,
      this.quantity);
  
  factory ShopItemModel.fromJson(Map<String, dynamic> json) =>
      _$ShopItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ShopItemModelToJson(this);
}
