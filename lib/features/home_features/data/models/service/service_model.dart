import 'package:json_annotation/json_annotation.dart';
part 'service_model.g.dart';

@JsonSerializable()
class ServiceModel {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: "type3")
  String type3;
  @JsonKey(name: "type2")
  String type2;
  @JsonKey(name: "type1")
  String type1;
  @JsonKey(name: 'country')
  String country;
  @JsonKey(name: 'city')
  String city;
  @JsonKey(name: 'createdDate')
  String createdDate;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'price')
  int price;
  @JsonKey(name: 'image1')
  String image1;
  @JsonKey(name: 'image2')
  String image2;
  @JsonKey(name: 'image3')
  String image3;
  @JsonKey(name: 'latitude')
  String latitude;
  @JsonKey(name: 'longitude')
  String longitude;
  @JsonKey(name: 'phoneNumber')
  String phoneNumber;
  @JsonKey(name: 'warranty')
  String warranty;
  @JsonKey(name: 'whatsAppNumber')
  String whatsAppNumber;
  @JsonKey(name: 'countDay')
  int countDay;
  @JsonKey(name: 'countPerson')
  int countPerson;
  @JsonKey(name: 'fromCountry')
  String fromCountry;
  @JsonKey(name: 'toCountry')
  String toCountry;
  @JsonKey(name: 'isApproved')
  bool isApproved;
  ServiceModel(
      this.id,
      this.title,
      this.price,
      this.type1,
      this.type2,
      this.type3,
      this.country,
      this.city,
      this.createdDate,
      this.description,
      this.phoneNumber,
      this.countDay,
      this.countPerson,
      this.fromCountry,
      this.image1,
      this.image2,
      this.image3,
      this.warranty,
      this.latitude, 
      this.longitude,
      this.toCountry,
      this.whatsAppNumber,
      this.isApproved
      );

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}
