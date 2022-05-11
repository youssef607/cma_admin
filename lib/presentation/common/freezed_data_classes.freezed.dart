// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginObjectTearOff {
  const _$LoginObjectTearOff();

  _LoginObject call(String userName, String password) {
    return _LoginObject(
      userName,
      password,
    );
  }
}

/// @nodoc
const $LoginObject = _$LoginObjectTearOff();

/// @nodoc
mixin _$LoginObject {
  String get userName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res>;
  $Res call({String userName, String password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res> implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  final LoginObject _value;
  // ignore: unused_field
  final $Res Function(LoginObject) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LoginObjectCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$LoginObjectCopyWith(
          _LoginObject value, $Res Function(_LoginObject) then) =
      __$LoginObjectCopyWithImpl<$Res>;
  @override
  $Res call({String userName, String password});
}

/// @nodoc
class __$LoginObjectCopyWithImpl<$Res> extends _$LoginObjectCopyWithImpl<$Res>
    implements _$LoginObjectCopyWith<$Res> {
  __$LoginObjectCopyWithImpl(
      _LoginObject _value, $Res Function(_LoginObject) _then)
      : super(_value, (v) => _then(v as _LoginObject));

  @override
  _LoginObject get _value => super._value as _LoginObject;

  @override
  $Res call({
    Object? userName = freezed,
    Object? password = freezed,
  }) {
    return _then(_LoginObject(
      userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginObject implements _LoginObject {
  _$_LoginObject(this.userName, this.password);

  @override
  final String userName;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginObject(userName: $userName, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginObject &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$LoginObjectCopyWith<_LoginObject> get copyWith =>
      __$LoginObjectCopyWithImpl<_LoginObject>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(String userName, String password) = _$_LoginObject;

  @override
  String get userName => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoginObjectCopyWith<_LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$AddUserObjectTearOff {
  const _$AddUserObjectTearOff();

  _AddUserObject call(PickerFile? image, String name, String role,
      String password, String username) {
    return _AddUserObject(
      image,
      name,
      role,
      password,
      username,
    );
  }
}

/// @nodoc
const $AddUserObject = _$AddUserObjectTearOff();

/// @nodoc
mixin _$AddUserObject {
  PickerFile? get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddUserObjectCopyWith<AddUserObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddUserObjectCopyWith<$Res> {
  factory $AddUserObjectCopyWith(
          AddUserObject value, $Res Function(AddUserObject) then) =
      _$AddUserObjectCopyWithImpl<$Res>;
  $Res call(
      {PickerFile? image,
      String name,
      String role,
      String password,
      String username});
}

/// @nodoc
class _$AddUserObjectCopyWithImpl<$Res>
    implements $AddUserObjectCopyWith<$Res> {
  _$AddUserObjectCopyWithImpl(this._value, this._then);

  final AddUserObject _value;
  // ignore: unused_field
  final $Res Function(AddUserObject) _then;

  @override
  $Res call({
    Object? image = freezed,
    Object? name = freezed,
    Object? role = freezed,
    Object? password = freezed,
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AddUserObjectCopyWith<$Res>
    implements $AddUserObjectCopyWith<$Res> {
  factory _$AddUserObjectCopyWith(
          _AddUserObject value, $Res Function(_AddUserObject) then) =
      __$AddUserObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {PickerFile? image,
      String name,
      String role,
      String password,
      String username});
}

/// @nodoc
class __$AddUserObjectCopyWithImpl<$Res>
    extends _$AddUserObjectCopyWithImpl<$Res>
    implements _$AddUserObjectCopyWith<$Res> {
  __$AddUserObjectCopyWithImpl(
      _AddUserObject _value, $Res Function(_AddUserObject) _then)
      : super(_value, (v) => _then(v as _AddUserObject));

  @override
  _AddUserObject get _value => super._value as _AddUserObject;

  @override
  $Res call({
    Object? image = freezed,
    Object? name = freezed,
    Object? role = freezed,
    Object? password = freezed,
    Object? username = freezed,
  }) {
    return _then(_AddUserObject(
      image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddUserObject implements _AddUserObject {
  _$_AddUserObject(
      this.image, this.name, this.role, this.password, this.username);

  @override
  final PickerFile? image;
  @override
  final String name;
  @override
  final String role;
  @override
  final String password;
  @override
  final String username;

  @override
  String toString() {
    return 'AddUserObject(image: $image, name: $name, role: $role, password: $password, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddUserObject &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(username);

  @JsonKey(ignore: true)
  @override
  _$AddUserObjectCopyWith<_AddUserObject> get copyWith =>
      __$AddUserObjectCopyWithImpl<_AddUserObject>(this, _$identity);
}

abstract class _AddUserObject implements AddUserObject {
  factory _AddUserObject(PickerFile? image, String name, String role,
      String password, String username) = _$_AddUserObject;

  @override
  PickerFile? get image => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get role => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  String get username => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddUserObjectCopyWith<_AddUserObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$AddCategoryObjectTearOff {
  const _$AddCategoryObjectTearOff();

  _AddCategoryObject call(String color, PickerFile? image, String label) {
    return _AddCategoryObject(
      color,
      image,
      label,
    );
  }
}

/// @nodoc
const $AddCategoryObject = _$AddCategoryObjectTearOff();

/// @nodoc
mixin _$AddCategoryObject {
  String get color => throw _privateConstructorUsedError;
  PickerFile? get image => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddCategoryObjectCopyWith<AddCategoryObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCategoryObjectCopyWith<$Res> {
  factory $AddCategoryObjectCopyWith(
          AddCategoryObject value, $Res Function(AddCategoryObject) then) =
      _$AddCategoryObjectCopyWithImpl<$Res>;
  $Res call({String color, PickerFile? image, String label});
}

/// @nodoc
class _$AddCategoryObjectCopyWithImpl<$Res>
    implements $AddCategoryObjectCopyWith<$Res> {
  _$AddCategoryObjectCopyWithImpl(this._value, this._then);

  final AddCategoryObject _value;
  // ignore: unused_field
  final $Res Function(AddCategoryObject) _then;

  @override
  $Res call({
    Object? color = freezed,
    Object? image = freezed,
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AddCategoryObjectCopyWith<$Res>
    implements $AddCategoryObjectCopyWith<$Res> {
  factory _$AddCategoryObjectCopyWith(
          _AddCategoryObject value, $Res Function(_AddCategoryObject) then) =
      __$AddCategoryObjectCopyWithImpl<$Res>;
  @override
  $Res call({String color, PickerFile? image, String label});
}

/// @nodoc
class __$AddCategoryObjectCopyWithImpl<$Res>
    extends _$AddCategoryObjectCopyWithImpl<$Res>
    implements _$AddCategoryObjectCopyWith<$Res> {
  __$AddCategoryObjectCopyWithImpl(
      _AddCategoryObject _value, $Res Function(_AddCategoryObject) _then)
      : super(_value, (v) => _then(v as _AddCategoryObject));

  @override
  _AddCategoryObject get _value => super._value as _AddCategoryObject;

  @override
  $Res call({
    Object? color = freezed,
    Object? image = freezed,
    Object? label = freezed,
  }) {
    return _then(_AddCategoryObject(
      color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddCategoryObject implements _AddCategoryObject {
  _$_AddCategoryObject(this.color, this.image, this.label);

  @override
  final String color;
  @override
  final PickerFile? image;
  @override
  final String label;

  @override
  String toString() {
    return 'AddCategoryObject(color: $color, image: $image, label: $label)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddCategoryObject &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(label);

  @JsonKey(ignore: true)
  @override
  _$AddCategoryObjectCopyWith<_AddCategoryObject> get copyWith =>
      __$AddCategoryObjectCopyWithImpl<_AddCategoryObject>(this, _$identity);
}

abstract class _AddCategoryObject implements AddCategoryObject {
  factory _AddCategoryObject(String color, PickerFile? image, String label) =
      _$_AddCategoryObject;

  @override
  String get color => throw _privateConstructorUsedError;
  @override
  PickerFile? get image => throw _privateConstructorUsedError;
  @override
  String get label => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddCategoryObjectCopyWith<_AddCategoryObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$AddSupplementObjectTearOff {
  const _$AddSupplementObjectTearOff();

  _AddSupplementObject call(
      String color, PickerFile? image, String price, String title) {
    return _AddSupplementObject(
      color,
      image,
      price,
      title,
    );
  }
}

/// @nodoc
const $AddSupplementObject = _$AddSupplementObjectTearOff();

/// @nodoc
mixin _$AddSupplementObject {
  String get color => throw _privateConstructorUsedError;
  PickerFile? get image => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddSupplementObjectCopyWith<AddSupplementObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddSupplementObjectCopyWith<$Res> {
  factory $AddSupplementObjectCopyWith(
          AddSupplementObject value, $Res Function(AddSupplementObject) then) =
      _$AddSupplementObjectCopyWithImpl<$Res>;
  $Res call({String color, PickerFile? image, String price, String title});
}

/// @nodoc
class _$AddSupplementObjectCopyWithImpl<$Res>
    implements $AddSupplementObjectCopyWith<$Res> {
  _$AddSupplementObjectCopyWithImpl(this._value, this._then);

  final AddSupplementObject _value;
  // ignore: unused_field
  final $Res Function(AddSupplementObject) _then;

  @override
  $Res call({
    Object? color = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AddSupplementObjectCopyWith<$Res>
    implements $AddSupplementObjectCopyWith<$Res> {
  factory _$AddSupplementObjectCopyWith(_AddSupplementObject value,
          $Res Function(_AddSupplementObject) then) =
      __$AddSupplementObjectCopyWithImpl<$Res>;
  @override
  $Res call({String color, PickerFile? image, String price, String title});
}

/// @nodoc
class __$AddSupplementObjectCopyWithImpl<$Res>
    extends _$AddSupplementObjectCopyWithImpl<$Res>
    implements _$AddSupplementObjectCopyWith<$Res> {
  __$AddSupplementObjectCopyWithImpl(
      _AddSupplementObject _value, $Res Function(_AddSupplementObject) _then)
      : super(_value, (v) => _then(v as _AddSupplementObject));

  @override
  _AddSupplementObject get _value => super._value as _AddSupplementObject;

  @override
  $Res call({
    Object? color = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? title = freezed,
  }) {
    return _then(_AddSupplementObject(
      color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as PickerFile?,
      price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddSupplementObject implements _AddSupplementObject {
  _$_AddSupplementObject(this.color, this.image, this.price, this.title);

  @override
  final String color;
  @override
  final PickerFile? image;
  @override
  final String price;
  @override
  final String title;

  @override
  String toString() {
    return 'AddSupplementObject(color: $color, image: $image, price: $price, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddSupplementObject &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(title);

  @JsonKey(ignore: true)
  @override
  _$AddSupplementObjectCopyWith<_AddSupplementObject> get copyWith =>
      __$AddSupplementObjectCopyWithImpl<_AddSupplementObject>(
          this, _$identity);
}

abstract class _AddSupplementObject implements AddSupplementObject {
  factory _AddSupplementObject(
          String color, PickerFile? image, String price, String title) =
      _$_AddSupplementObject;

  @override
  String get color => throw _privateConstructorUsedError;
  @override
  PickerFile? get image => throw _privateConstructorUsedError;
  @override
  String get price => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddSupplementObjectCopyWith<_AddSupplementObject> get copyWith =>
      throw _privateConstructorUsedError;
}
