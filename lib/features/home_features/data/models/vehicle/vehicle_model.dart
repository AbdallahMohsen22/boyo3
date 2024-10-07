import 'package:json_annotation/json_annotation.dart';
part 'vehicle_model.g.dart';

@JsonSerializable()
class VehicleModel {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "fullName")
  String fullName;
  @JsonKey(name: "userId")
  String userId;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "description")
  String description;
   @JsonKey(name: "phoneNumber")
  String phoneNumber;
  @JsonKey(name: "latitude")
  String latitude;
  @JsonKey(name: "longitude")
  String longitude;
  @JsonKey(name: "price")
  int price;
  @JsonKey(name: "country")
  String country;
  @JsonKey(name: "createdDate")
  String createdDate;
  @JsonKey(name: "type3")
  String type3;
  @JsonKey(name: "type2")
  String type2;
  @JsonKey(name: "type1")
  String type1;
  @JsonKey(name: "type4")
  String type4;
  @JsonKey(name: "warranty")
  String warranty;
  @JsonKey(name: "whatsAppNumber")
  String whatsAppNumber;
  @JsonKey(name: "image1")
  String image1;
  @JsonKey(name: "image2")
  String image2;
  @JsonKey(name: "image3")
  String image3;
  @JsonKey(name: "addOns")
  String addOns;
  @JsonKey(name: "adsType")
  String adsType;
  @JsonKey(name: "size")
  String size;
  @JsonKey(name: "airConditionCount")
  String airConditionCount;
  @JsonKey(name: "airConditionSize")
  String airConditionSize;
  @JsonKey(name: "airConditionType")
  String airConditionType;
  @JsonKey(name: "colorIn")
  String colorIn;
  @JsonKey(name: "colorOut")
  String colorOut;
  @JsonKey(name: "cylinders")
  int cylinders;
  @JsonKey(name: "faults")
  String faults;
  @JsonKey(name: "height")
  int height;
  @JsonKey(name: "generatorType")
  String generatorType;
  @JsonKey(name: "kilometer")
  int kilometer;
  @JsonKey(name: "normalOrSaylant")
  String normalOrSaylant;
  @JsonKey(name: "numberOfParson")
  int numberOfParson;
  @JsonKey(name: "publicStatus")
  String publicStatus;
  @JsonKey(name: "security")
  String security;
  @JsonKey(name: "specifications")
  String specifications;
  @JsonKey(name: "yearMake")
  String yearMake;
  @JsonKey(name: "city")
  String city;
  @JsonKey(name: "isApproved")
  bool isApproved;


  VehicleModel(
      this.id,
      this.title,
      this.userId,
      this.description,
      this.type1,
      this.type2,
      this.type3,
      this.type4,
      this.image1,
      this.image2,
      this.image3,
      this.country,
      this.createdDate,
      this.longitude,
      this.latitude,
      this.phoneNumber,
      this.price,
      this.warranty,
      this.adsType,
      this.fullName,
      this.security,
      this.height,
      this.generatorType,
      this.size,
      this.addOns,
      this.airConditionCount,
      this.airConditionSize,
      this.airConditionType,
      this.colorIn,
      this.colorOut,
      this.cylinders,
      this.kilometer,
      this.normalOrSaylant,
      this.numberOfParson,
      this.whatsAppNumber,
      this.publicStatus,
      this.specifications,
      this.yearMake,
      this.faults,
      this.city,
      this.isApproved,

      );

  factory VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleModelToJson(this);
}
