import 'dart:io';
import 'dart:typed_data';

import 'package:cma_admin/domain/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_classes.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String userName, String password) = _LoginObject;
}

@freezed
class AddUserObject with _$AddUserObject {
  factory AddUserObject(
    PickerFile? image,
    String name,
    String role,
    String password,
    String username,
  ) = _AddUserObject;
}
