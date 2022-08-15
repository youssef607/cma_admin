import 'package:cma_admin/domain/model/model.dart';
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
  String color;

  AddCategoryRequest(this.image, this.label, this.color);
}

class AddSupplementRequest {
  String color;
  PickerFile? image;
  String price;
  String title;

  AddSupplementRequest(this.color, this.image, this.price, this.title);
}

class AddProductRequest {
  String categoryId;
  String color;
  PickerFile? image;
  String price;
  String title;

  AddProductRequest(
      this.categoryId, this.color, this.image, this.price, this.title);
}

//update
class UpdateSupplementRequest {
  String id;
  String color;
  PickerFile? image;
  String price;
  String title;

  UpdateSupplementRequest(
      this.id, this.color, this.image, this.price, this.title);
}

class UpdateUserRequest {
  String id;
  PickerFile? image;
  String name;
  String password;

  String role;
  String username;

  UpdateUserRequest(
      this.id, this.image, this.name, this.password, this.role, this.username);
}

class UpdateCategoryRequest {
  String id;
  PickerFile? image;
  String label;
  String color;

  UpdateCategoryRequest(this.id, this.image, this.label, this.color);
}

class UpdateProductRequest {
  String id;
  String categoryId;
  String color;
  PickerFile? image;
  String price;
  String title;

  UpdateProductRequest(
      this.id, this.categoryId, this.color, this.image, this.price, this.title);
}

