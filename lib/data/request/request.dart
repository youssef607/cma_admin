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
  String image;
  String name;
  String role;
  String password;
  String username;

  AddUserRequest(
      this.image, this.name, this.password, this.role, this.username);
}
