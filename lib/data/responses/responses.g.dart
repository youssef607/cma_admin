// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) {
  return SignInResponse(
    json['token'] as String?,
    json['user'] == null
        ? null
        : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SignInResponseToJson(SignInResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return UserResponse(
    json['image'] as String?,
    json['name'] as String?,
    json['password'] as String?,
    json['role'] as String?,
    json['userName'] as String?,
  )
    ..id = json['id'] as int?
    ..createdAt = json['createdAt'] as String?
    ..deletedAt = json['deletedAt'] as String?
    ..modifiedAt = json['modifiedAt'] as String?
    ..active = json['active'] as bool?;
}

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'deletedAt': instance.deletedAt,
      'modifiedAt': instance.modifiedAt,
      'active': instance.active,
      'image': instance.image,
      'name': instance.name,
      'password': instance.password,
      'role': instance.role,
      'userName': instance.userName,
    };

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) {
  return CategoryResponse(
    json['color'] as String?,
    json['image'] as String?,
    json['label'] as String?,
  )
    ..id = json['id'] as int?
    ..createdAt = json['createdAt'] as String?
    ..deletedAt = json['deletedAt'] as String?
    ..modifiedAt = json['modifiedAt'] as String?
    ..active = json['active'] as bool?;
}

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'deletedAt': instance.deletedAt,
      'modifiedAt': instance.modifiedAt,
      'active': instance.active,
      'color': instance.color,
      'image': instance.image,
      'label': instance.label,
    };
