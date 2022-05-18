import 'package:json_annotation/json_annotation.dart';
part 'models_response.g.dart';

@JsonSerializable()
class ModelsResponse {
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "status")
  int status;
  @JsonKey(name: "data")
  List<Data> data;

  ModelsResponse({required this.message, required this.status, required this.data});

  factory ModelsResponse.fromJson(Map<String, dynamic> json) => _$ModelsResponseFromJson(json);

  Map<String, dynamic> toJson() =>_$ModelsResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "modelName")
  String modelName;
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "modelUrl")
  String modelUrl;
  @JsonKey(name: "serviceList")
  List<ServiceList> serviceList;

  Data(
      {required this.modelName,
      required this.id,
      required this.status,
      required this.image,
      required this.modelUrl,
      required this.serviceList});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() =>_$DataToJson(this);
}

@JsonSerializable()
class ServiceList {
  @JsonKey(name: "sId")
  String sId;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "amount")
  String amount;

  ServiceList({required this.sId, required this.title, required this.amount});

  factory ServiceList.fromJson(Map<String, dynamic> json) => _$ServiceListFromJson(json);

  Map<String, dynamic> toJson() =>_$ServiceListToJson(this);
}
