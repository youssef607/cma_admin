import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

class BaseResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "createdAt")
  String? createdAt;

  @JsonKey(name: "deletedAt")
  String? deletedAt;

  @JsonKey(name: "modifiedAt")
  String? modifiedAt;

  @JsonKey(name: "active")
  bool? active;
}

@JsonSerializable()
class SignInResponse {
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  UserResponse? user;

  SignInResponse(this.token, this.user);

// from json
  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}

@JsonSerializable()
class UserResponse extends BaseResponse {
  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "role")
  String? role;

  @JsonKey(name: "userName")
  String? userName;

  UserResponse(this.image, this.name, this.role, this.userName);

  // from json
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
