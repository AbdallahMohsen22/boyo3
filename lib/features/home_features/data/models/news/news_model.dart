import 'package:json_annotation/json_annotation.dart';
part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  @JsonKey(name: 'title')
  String title;
  //createdDatea
  @JsonKey(name: 'createdDate')
  String createdDate;

  NewsModel(this.title, this.createdDate);

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
    Map<String, dynamic> toJson() => _$NewsModelToJson(this);

}
