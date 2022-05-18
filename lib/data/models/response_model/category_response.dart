import 'package:json_annotation/json_annotation.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "status")
  int status;
  @JsonKey(name: "data")
  List<Data> data;

  CategoryResponse(
      {required this.message, required this.status, required this.data});
  factory CategoryResponse.fromJson(Map<String, dynamic> json) => _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() =>_$CategoryResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "catName")
  String catName;
  @JsonKey(name: "id")
  String id;

  Data({required this.catName, required this.id});
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() =>_$DataToJson(this);
}
