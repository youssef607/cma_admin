import 'dart:io';
import 'dart:typed_data';

import 'package:cma_admin/domain/model/model.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'request.g.dart';

class SignInRequest {
  String userName;
  String password;

  SignInRequest(this.userName, this.password);
}

@JsonSerializable()
class UserRequest {
  int id;

  UserRequest(this.id);

  // from json
  factory UserRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRequestFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$UserRequestToJson(this);
}

class AddUserRequest {
  PickerFile? image;
  String name;
  String password;

  String role;
  String username;

  AddUserRequest(
      this.image, this.name, this.password, this.role, this.username);
}

class AddCategoryRequest {
  PickerFile? image;
  String label;
  Color color;

  AddCategoryRequest(this.image, this.label, this.color);
}
