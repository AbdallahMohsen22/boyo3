import 'package:json_annotation/json_annotation.dart';
part 'search_service_model.g.dart';

@JsonSerializable()
class SearchServiceModel {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: 'fullName')
  String fullName;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'whatsAppNumber')
  String whatsAppNumber;
  @JsonKey(name: "type3")
  String type3;
  @JsonKey(name: "type2")
  String type2;
  @JsonKey(name: "type1")
  String type1;
  @JsonKey(name: 'image1')
  String image1;
  @JsonKey(name: 'image2')
  String image2;
  @JsonKey(name: 'image3')
  String image3;
  @JsonKey(name: 'country')
  String country;
  @JsonKey(name: 'createdDate')
  String createdDate;
  @JsonKey(name: 'latitude')
  String latitude;
  @JsonKey(name: 'longitude')
  String longitude;
  @JsonKey(name: 'phoneNumber')
  String phoneNumber;
  @JsonKey(name: 'price')
  int price;
  @JsonKey(name: 'warranty')
  String warranty;

  SearchServiceModel(
      this.id,
      this.title,
      this.price,
      this.type1,
      this.type2,
      this.type3,
      this.country,
      this.createdDate,
      this.description,
      this.phoneNumber,
      this.image1,
      this.image2,
      this.image3,
      this.warranty,
      this.latitude, 
      this.longitude,
      this.whatsAppNumber,
      this.fullName
      );

  factory SearchServiceModel.fromJson(Map<String, dynamic> json) =>
      _$SearchServiceModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchServiceModelToJson(this);
}
