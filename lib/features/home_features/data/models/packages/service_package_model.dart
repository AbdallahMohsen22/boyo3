// "title": "Gold",
// "validityDay": 5,
// "featuredAds": 2,
// "price": 150,
// "sections": "All"

import 'package:json_annotation/json_annotation.dart';
part 'service_package_model.g.dart';

@JsonSerializable()
class ServicePackageModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'validityDay')
  int validityDay;
  @JsonKey(name: 'featuredAds')
  int featuredAds;
  @JsonKey(name: 'price')
  int price;
  @JsonKey(name: 'sections')
  String sections;

  ServicePackageModel(this.id,this.title, this.validityDay, this.featuredAds, this.price,
      this.sections);

  factory ServicePackageModel.fromJson(Map<String, dynamic> json) =>
      _$ServicePackageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServicePackageModelToJson(this);
}
