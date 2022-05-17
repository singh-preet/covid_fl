// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      message: json['message'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      appId: json['appId'] as String,
      status: json['status'] as int,
      userStatus: json['user_status'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'appId': instance.appId,
      'status': instance.status,
      'user_status': instance.userStatus,
    };
