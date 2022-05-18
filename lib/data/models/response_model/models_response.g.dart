// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelsResponse _$ModelsResponseFromJson(Map<String, dynamic> json) =>
    ModelsResponse(
      message: json['message'] as String,
      status: json['status'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ModelsResponseToJson(ModelsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      modelName: json['modelName'] as String,
      id: json['id'] as String,
      status: json['status'] as String,
      image: json['image'] as String,
      modelUrl: json['modelUrl'] as String,
      serviceList: (json['serviceList'] as List<dynamic>)
          .map((e) => ServiceList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'modelName': instance.modelName,
      'id': instance.id,
      'status': instance.status,
      'image': instance.image,
      'modelUrl': instance.modelUrl,
      'serviceList': instance.serviceList,
    };

ServiceList _$ServiceListFromJson(Map<String, dynamic> json) => ServiceList(
      sId: json['sId'] as String,
      title: json['title'] as String,
      amount: json['amount'] as String,
    );

Map<String, dynamic> _$ServiceListToJson(ServiceList instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'title': instance.title,
      'amount': instance.amount,
    };
