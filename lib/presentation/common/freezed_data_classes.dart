import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_classes.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String userName, String password) = _LoginObject;
}

@freezed
class RegisterObject with _$RegisterObject {
  factory RegisterObject(
      String countryMobileCode,
      String mobileNumber,
      String userName,
      String email,
      String password,
      String profilePicture) = _RegisterObject;
}

@freezed
class AddUserObject with _$AddUserObject {
  factory AddUserObject(
    String image,
    String name,
    String role,
    String password,
    String username,
  ) = _AddUserObject;
}
