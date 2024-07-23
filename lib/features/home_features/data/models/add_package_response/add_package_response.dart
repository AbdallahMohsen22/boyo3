import 'package:json_annotation/json_annotation.dart';
part 'add_package_response.g.dart';

@JsonSerializable()
class UserAddPackageModel {
  @JsonKey(name: 'messages')
  String message;
  UserAddPackageModel(this.message);

  factory UserAddPackageModel.fromJson(Map<String, dynamic> json) =>
      _$UserAddPackageModelFromJson(json);
    Map<String, dynamic> toJson() => _$UserAddPackageModelToJson(this);

}
