import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse{
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "userId")
  String userId;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "appId")
  String appId;
  @JsonKey(name: "status")
  int status;
  @JsonKey(name: "user_status")
  String userStatus;

  LoginResponse(
      {
        required this.message,
        required this.userId,
        required this.name,
        required this.email,
        required this.appId,
        required this.status,
        required this.userStatus});


  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() =>_$LoginResponseToJson(this);
}