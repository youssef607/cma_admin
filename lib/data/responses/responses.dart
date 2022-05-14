import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/cupertino.dart';

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

  @JsonKey(name: "password")
  String? password;

  @JsonKey(name: "role")
  String? role;

  @JsonKey(name: "userName")
  String? userName;

  UserResponse(this.image, this.name, this.password, this.role, this.userName);

  // from json
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class CategoryResponse extends BaseResponse {
  @JsonKey(name: "color")
  String? color;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "label")
  String? label;

  CategoryResponse(this.color, this.image, this.label);

// from json
  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}

@JsonSerializable()
class SupplementResponse extends BaseResponse {
  @JsonKey(name: "color")
  String? color;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "title")
  String? title;

  SupplementResponse(this.color, this.image, this.title, this.price);

// from json
  factory SupplementResponse.fromJson(Map<String, dynamic> json) =>
      _$SupplementResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$SupplementResponseToJson(this);
}

@JsonSerializable()
class ProductResponse extends BaseResponse {
  @JsonKey(name: "color")
  String? color;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "price")
  double? price;

  @JsonKey(name: "category")
  CategoryResponse? category;

  @JsonKey(name: "supplements")
  List<SupplementResponse>? supplements;

  ProductResponse(this.color, this.image, this.title, this.price, this.category,
      this.supplements);

  // from json
  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
