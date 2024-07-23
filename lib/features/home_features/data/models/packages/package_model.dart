// "title": "Gold",
// "validityDay": 5,
// "featuredAds": 2,
// "price": 150,
// "sections": "All"

import 'package:json_annotation/json_annotation.dart';
part 'package_model.g.dart';

@JsonSerializable()
class PackageModel {
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

  PackageModel(this.id,this.title, this.validityDay, this.featuredAds, this.price,
      this.sections);

  factory PackageModel.fromJson(Map<String, dynamic> json) =>
      _$PackageModelFromJson(json);

  Map<String, dynamic> toJson() => _$PackageModelToJson(this);
}
