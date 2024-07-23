import 'package:json_annotation/json_annotation.dart';
part "add_service_package_response.g.dart";

@JsonSerializable()
class UserAddServicePackageModel {
  @JsonKey(name: 'messages')
  String message;
  UserAddServicePackageModel(this.message);

  factory UserAddServicePackageModel.fromJson(Map<String, dynamic> json) =>
      _$UserAddServicePackageModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserAddServicePackageModelToJson(this);
}
