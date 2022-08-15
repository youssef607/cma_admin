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

/// @nodoc
class _$AddProductObjectTearOff {
  const _$AddProductObjectTearOff();

  _AddProductObject call(String categoryId, String color, PickerFile? image,
      String price, String title) {
    return _AddProductObject(
      categoryId,
      color,
      image,
      price,
      title,
    );
  }
}

/// @nodoc
const $AddProductObject = _$AddProductObjectTearOff();

/// @nodoc
mixin _$AddProductObject {
  String get categoryId => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  PickerFile? get image => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddProductObjectCopyWith<AddProductObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddProductObjectCopyWith<$Res> {
  factory $AddProductObjectCopyWith(
          AddProductObject value, $Res Function(AddProductObject) then) =
      _$AddProductObjectCopyWithImpl<$Res>;
  $Res call(
      {String categoryId,
      String color,
      PickerFile? image,
      String price,
      String title});
}

/// @nodoc
class _$AddProductObjectCopyWithImpl<$Res>
    implements $AddProductObjectCopyWith<$Res> {
  _$AddProductObjectCopyWithImpl(this._value, this._then);

  final AddProductObject _value;
  // ignore: unused_field
  final $Res Function(AddProductObject) _then;

  @override
  $Res call({
    Object? categoryId = freezed,
    Object? color = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$AddProductObjectCopyWith<$Res>
    implements $AddProductObjectCopyWith<$Res> {
  factory _$AddProductObjectCopyWith(
          _AddProductObject value, $Res Function(_AddProductObject) then) =
      __$AddProductObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String categoryId,
      String color,
      PickerFile? image,
      String price,
      String title});
}

/// @nodoc
class __$AddProductObjectCopyWithImpl<$Res>
    extends _$AddProductObjectCopyWithImpl<$Res>
    implements _$AddProductObjectCopyWith<$Res> {
  __$AddProductObjectCopyWithImpl(
      _AddProductObject _value, $Res Function(_AddProductObject) _then)
      : super(_value, (v) => _then(v as _AddProductObject));

  @override
  _AddProductObject get _value => super._value as _AddProductObject;

  @override
  $Res call({
    Object? categoryId = freezed,
    Object? color = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? title = freezed,
  }) {
    return _then(_AddProductObject(
      categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$_AddProductObject implements _AddProductObject {
  _$_AddProductObject(
      this.categoryId, this.color, this.image, this.price, this.title);

  @override
  final String categoryId;
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
    return 'AddProductObject(categoryId: $categoryId, color: $color, image: $image, price: $price, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddProductObject &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
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
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(title);

  @JsonKey(ignore: true)
  @override
  _$AddProductObjectCopyWith<_AddProductObject> get copyWith =>
      __$AddProductObjectCopyWithImpl<_AddProductObject>(this, _$identity);
}

abstract class _AddProductObject implements AddProductObject {
  factory _AddProductObject(String categoryId, String color, PickerFile? image,
      String price, String title) = _$_AddProductObject;

  @override
  String get categoryId => throw _privateConstructorUsedError;
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
  _$AddProductObjectCopyWith<_AddProductObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$UpdateSupplementObjectTearOff {
  const _$UpdateSupplementObjectTearOff();

  _UpdateSupplementObject call(
      String id, String color, PickerFile? image, String price, String title) {
    return _UpdateSupplementObject(
      id,
      color,
      image,
      price,
      title,
    );
  }
}

/// @nodoc
const $UpdateSupplementObject = _$UpdateSupplementObjectTearOff();

/// @nodoc
mixin _$UpdateSupplementObject {
  String get id => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  PickerFile? get image => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateSupplementObjectCopyWith<UpdateSupplementObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateSupplementObjectCopyWith<$Res> {
  factory $UpdateSupplementObjectCopyWith(UpdateSupplementObject value,
          $Res Function(UpdateSupplementObject) then) =
      _$UpdateSupplementObjectCopyWithImpl<$Res>;
  $Res call(
      {String id, String color, PickerFile? image, String price, String title});
}

/// @nodoc
class _$UpdateSupplementObjectCopyWithImpl<$Res>
    implements $UpdateSupplementObjectCopyWith<$Res> {
  _$UpdateSupplementObjectCopyWithImpl(this._value, this._then);

  final UpdateSupplementObject _value;
  // ignore: unused_field
  final $Res Function(UpdateSupplementObject) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? color = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$UpdateSupplementObjectCopyWith<$Res>
    implements $UpdateSupplementObjectCopyWith<$Res> {
  factory _$UpdateSupplementObjectCopyWith(_UpdateSupplementObject value,
          $Res Function(_UpdateSupplementObject) then) =
      __$UpdateSupplementObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, String color, PickerFile? image, String price, String title});
}

/// @nodoc
class __$UpdateSupplementObjectCopyWithImpl<$Res>
    extends _$UpdateSupplementObjectCopyWithImpl<$Res>
    implements _$UpdateSupplementObjectCopyWith<$Res> {
  __$UpdateSupplementObjectCopyWithImpl(_UpdateSupplementObject _value,
      $Res Function(_UpdateSupplementObject) _then)
      : super(_value, (v) => _then(v as _UpdateSupplementObject));

  @override
  _UpdateSupplementObject get _value => super._value as _UpdateSupplementObject;

  @override
  $Res call({
    Object? id = freezed,
    Object? color = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? title = freezed,
  }) {
    return _then(_UpdateSupplementObject(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$_UpdateSupplementObject implements _UpdateSupplementObject {
  _$_UpdateSupplementObject(
      this.id, this.color, this.image, this.price, this.title);

  @override
  final String id;
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
    return 'UpdateSupplementObject(id: $id, color: $color, image: $image, price: $price, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateSupplementObject &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
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
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(title);

  @JsonKey(ignore: true)
  @override
  _$UpdateSupplementObjectCopyWith<_UpdateSupplementObject> get copyWith =>
      __$UpdateSupplementObjectCopyWithImpl<_UpdateSupplementObject>(
          this, _$identity);
}

abstract class _UpdateSupplementObject implements UpdateSupplementObject {
  factory _UpdateSupplementObject(String id, String color, PickerFile? image,
      String price, String title) = _$_UpdateSupplementObject;

  @override
  String get id => throw _privateConstructorUsedError;
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
  _$UpdateSupplementObjectCopyWith<_UpdateSupplementObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$UpdateCategoryObjectTearOff {
  const _$UpdateCategoryObjectTearOff();

  _UpdateCategoryObject call(
      String id, String color, PickerFile? image, String label) {
    return _UpdateCategoryObject(
      id,
      color,
      image,
      label,
    );
  }
}

/// @nodoc
const $UpdateCategoryObject = _$UpdateCategoryObjectTearOff();

/// @nodoc
mixin _$UpdateCategoryObject {
  String get id => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  PickerFile? get image => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateCategoryObjectCopyWith<UpdateCategoryObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateCategoryObjectCopyWith<$Res> {
  factory $UpdateCategoryObjectCopyWith(UpdateCategoryObject value,
          $Res Function(UpdateCategoryObject) then) =
      _$UpdateCategoryObjectCopyWithImpl<$Res>;
  $Res call({String id, String color, PickerFile? image, String label});
}

/// @nodoc
class _$UpdateCategoryObjectCopyWithImpl<$Res>
    implements $UpdateCategoryObjectCopyWith<$Res> {
  _$UpdateCategoryObjectCopyWithImpl(this._value, this._then);

  final UpdateCategoryObject _value;
  // ignore: unused_field
  final $Res Function(UpdateCategoryObject) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? color = freezed,
    Object? image = freezed,
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$UpdateCategoryObjectCopyWith<$Res>
    implements $UpdateCategoryObjectCopyWith<$Res> {
  factory _$UpdateCategoryObjectCopyWith(_UpdateCategoryObject value,
          $Res Function(_UpdateCategoryObject) then) =
      __$UpdateCategoryObjectCopyWithImpl<$Res>;
  @override
  $Res call({String id, String color, PickerFile? image, String label});
}

/// @nodoc
class __$UpdateCategoryObjectCopyWithImpl<$Res>
    extends _$UpdateCategoryObjectCopyWithImpl<$Res>
    implements _$UpdateCategoryObjectCopyWith<$Res> {
  __$UpdateCategoryObjectCopyWithImpl(
      _UpdateCategoryObject _value, $Res Function(_UpdateCategoryObject) _then)
      : super(_value, (v) => _then(v as _UpdateCategoryObject));

  @override
  _UpdateCategoryObject get _value => super._value as _UpdateCategoryObject;

  @override
  $Res call({
    Object? id = freezed,
    Object? color = freezed,
    Object? image = freezed,
    Object? label = freezed,
  }) {
    return _then(_UpdateCategoryObject(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$_UpdateCategoryObject implements _UpdateCategoryObject {
  _$_UpdateCategoryObject(this.id, this.color, this.image, this.label);

  @override
  final String id;
  @override
  final String color;
  @override
  final PickerFile? image;
  @override
  final String label;

  @override
  String toString() {
    return 'UpdateCategoryObject(id: $id, color: $color, image: $image, label: $label)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateCategoryObject &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
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
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(label);

  @JsonKey(ignore: true)
  @override
  _$UpdateCategoryObjectCopyWith<_UpdateCategoryObject> get copyWith =>
      __$UpdateCategoryObjectCopyWithImpl<_UpdateCategoryObject>(
          this, _$identity);
}

abstract class _UpdateCategoryObject implements UpdateCategoryObject {
  factory _UpdateCategoryObject(
          String id, String color, PickerFile? image, String label) =
      _$_UpdateCategoryObject;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get color => throw _privateConstructorUsedError;
  @override
  PickerFile? get image => throw _privateConstructorUsedError;
  @override
  String get label => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UpdateCategoryObjectCopyWith<_UpdateCategoryObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$UpdateProductObjectTearOff {
  const _$UpdateProductObjectTearOff();

  _UpdateProductObject call(String id, String categoryId, String color,
      PickerFile? image, String price, String title) {
    return _UpdateProductObject(
      id,
      categoryId,
      color,
      image,
      price,
      title,
    );
  }
}

/// @nodoc
const $UpdateProductObject = _$UpdateProductObjectTearOff();

/// @nodoc
mixin _$UpdateProductObject {
  String get id => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  PickerFile? get image => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateProductObjectCopyWith<UpdateProductObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateProductObjectCopyWith<$Res> {
  factory $UpdateProductObjectCopyWith(
          UpdateProductObject value, $Res Function(UpdateProductObject) then) =
      _$UpdateProductObjectCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String categoryId,
      String color,
      PickerFile? image,
      String price,
      String title});
}

/// @nodoc
class _$UpdateProductObjectCopyWithImpl<$Res>
    implements $UpdateProductObjectCopyWith<$Res> {
  _$UpdateProductObjectCopyWithImpl(this._value, this._then);

  final UpdateProductObject _value;
  // ignore: unused_field
  final $Res Function(UpdateProductObject) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? color = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$UpdateProductObjectCopyWith<$Res>
    implements $UpdateProductObjectCopyWith<$Res> {
  factory _$UpdateProductObjectCopyWith(_UpdateProductObject value,
          $Res Function(_UpdateProductObject) then) =
      __$UpdateProductObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String categoryId,
      String color,
      PickerFile? image,
      String price,
      String title});
}

/// @nodoc
class __$UpdateProductObjectCopyWithImpl<$Res>
    extends _$UpdateProductObjectCopyWithImpl<$Res>
    implements _$UpdateProductObjectCopyWith<$Res> {
  __$UpdateProductObjectCopyWithImpl(
      _UpdateProductObject _value, $Res Function(_UpdateProductObject) _then)
      : super(_value, (v) => _then(v as _UpdateProductObject));

  @override
  _UpdateProductObject get _value => super._value as _UpdateProductObject;

  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? color = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? title = freezed,
  }) {
    return _then(_UpdateProductObject(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$_UpdateProductObject implements _UpdateProductObject {
  _$_UpdateProductObject(
      this.id, this.categoryId, this.color, this.image, this.price, this.title);

  @override
  final String id;
  @override
  final String categoryId;
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
    return 'UpdateProductObject(id: $id, categoryId: $categoryId, color: $color, image: $image, price: $price, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateProductObject &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
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
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(title);

  @JsonKey(ignore: true)
  @override
  _$UpdateProductObjectCopyWith<_UpdateProductObject> get copyWith =>
      __$UpdateProductObjectCopyWithImpl<_UpdateProductObject>(
          this, _$identity);
}

abstract class _UpdateProductObject implements UpdateProductObject {
  factory _UpdateProductObject(String id, String categoryId, String color,
      PickerFile? image, String price, String title) = _$_UpdateProductObject;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get categoryId => throw _privateConstructorUsedError;
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
  _$UpdateProductObjectCopyWith<_UpdateProductObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$AddSupplementsToProductObjectTearOff {
  const _$AddSupplementsToProductObjectTearOff();

  _AddSupplementsToProductObject call(List<int> selectedSupplements) {
    return _AddSupplementsToProductObject(
      selectedSupplements,
    );
  }
}

/// @nodoc
const $AddSupplementsToProductObject = _$AddSupplementsToProductObjectTearOff();

/// @nodoc
mixin _$AddSupplementsToProductObject {
  List<int> get selectedSupplements => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddSupplementsToProductObjectCopyWith<AddSupplementsToProductObject>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddSupplementsToProductObjectCopyWith<$Res> {
  factory $AddSupplementsToProductObjectCopyWith(
          AddSupplementsToProductObject value,
          $Res Function(AddSupplementsToProductObject) then) =
      _$AddSupplementsToProductObjectCopyWithImpl<$Res>;
  $Res call({List<int> selectedSupplements});
}

/// @nodoc
class _$AddSupplementsToProductObjectCopyWithImpl<$Res>
    implements $AddSupplementsToProductObjectCopyWith<$Res> {
  _$AddSupplementsToProductObjectCopyWithImpl(this._value, this._then);

  final AddSupplementsToProductObject _value;
  // ignore: unused_field
  final $Res Function(AddSupplementsToProductObject) _then;

  @override
  $Res call({
    Object? selectedSupplements = freezed,
  }) {
    return _then(_value.copyWith(
      selectedSupplements: selectedSupplements == freezed
          ? _value.selectedSupplements
          : selectedSupplements // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
abstract class _$AddSupplementsToProductObjectCopyWith<$Res>
    implements $AddSupplementsToProductObjectCopyWith<$Res> {
  factory _$AddSupplementsToProductObjectCopyWith(
          _AddSupplementsToProductObject value,
          $Res Function(_AddSupplementsToProductObject) then) =
      __$AddSupplementsToProductObjectCopyWithImpl<$Res>;
  @override
  $Res call({List<int> selectedSupplements});
}

/// @nodoc
class __$AddSupplementsToProductObjectCopyWithImpl<$Res>
    extends _$AddSupplementsToProductObjectCopyWithImpl<$Res>
    implements _$AddSupplementsToProductObjectCopyWith<$Res> {
  __$AddSupplementsToProductObjectCopyWithImpl(
      _AddSupplementsToProductObject _value,
      $Res Function(_AddSupplementsToProductObject) _then)
      : super(_value, (v) => _then(v as _AddSupplementsToProductObject));

  @override
  _AddSupplementsToProductObject get _value =>
      super._value as _AddSupplementsToProductObject;

  @override
  $Res call({
    Object? selectedSupplements = freezed,
  }) {
    return _then(_AddSupplementsToProductObject(
      selectedSupplements == freezed
          ? _value.selectedSupplements
          : selectedSupplements // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_AddSupplementsToProductObject
    implements _AddSupplementsToProductObject {
  _$_AddSupplementsToProductObject(this.selectedSupplements);

  @override
  final List<int> selectedSupplements;

  @override
  String toString() {
    return 'AddSupplementsToProductObject(selectedSupplements: $selectedSupplements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddSupplementsToProductObject &&
            (identical(other.selectedSupplements, selectedSupplements) ||
                const DeepCollectionEquality()
                    .equals(other.selectedSupplements, selectedSupplements)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectedSupplements);

  @JsonKey(ignore: true)
  @override
  _$AddSupplementsToProductObjectCopyWith<_AddSupplementsToProductObject>
      get copyWith => __$AddSupplementsToProductObjectCopyWithImpl<
          _AddSupplementsToProductObject>(this, _$identity);
}

abstract class _AddSupplementsToProductObject
    implements AddSupplementsToProductObject {
  factory _AddSupplementsToProductObject(List<int> selectedSupplements) =
      _$_AddSupplementsToProductObject;

  @override
  List<int> get selectedSupplements => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddSupplementsToProductObjectCopyWith<_AddSupplementsToProductObject>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$OrdersViewObjectTearOff {
  const _$OrdersViewObjectTearOff();

  _OrdersViewObject call(PickerDateRange dateRange) {
    return _OrdersViewObject(
      dateRange,
    );
  }
}

/// @nodoc
const $OrdersViewObject = _$OrdersViewObjectTearOff();

/// @nodoc
mixin _$OrdersViewObject {
  PickerDateRange get dateRange => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrdersViewObjectCopyWith<OrdersViewObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersViewObjectCopyWith<$Res> {
  factory $OrdersViewObjectCopyWith(
          OrdersViewObject value, $Res Function(OrdersViewObject) then) =
      _$OrdersViewObjectCopyWithImpl<$Res>;
  $Res call({PickerDateRange dateRange});
}

/// @nodoc
class _$OrdersViewObjectCopyWithImpl<$Res>
    implements $OrdersViewObjectCopyWith<$Res> {
  _$OrdersViewObjectCopyWithImpl(this._value, this._then);

  final OrdersViewObject _value;
  // ignore: unused_field
  final $Res Function(OrdersViewObject) _then;

  @override
  $Res call({
    Object? dateRange = freezed,
  }) {
    return _then(_value.copyWith(
      dateRange: dateRange == freezed
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as PickerDateRange,
    ));
  }
}

/// @nodoc
abstract class _$OrdersViewObjectCopyWith<$Res>
    implements $OrdersViewObjectCopyWith<$Res> {
  factory _$OrdersViewObjectCopyWith(
          _OrdersViewObject value, $Res Function(_OrdersViewObject) then) =
      __$OrdersViewObjectCopyWithImpl<$Res>;
  @override
  $Res call({PickerDateRange dateRange});
}

/// @nodoc
class __$OrdersViewObjectCopyWithImpl<$Res>
    extends _$OrdersViewObjectCopyWithImpl<$Res>
    implements _$OrdersViewObjectCopyWith<$Res> {
  __$OrdersViewObjectCopyWithImpl(
      _OrdersViewObject _value, $Res Function(_OrdersViewObject) _then)
      : super(_value, (v) => _then(v as _OrdersViewObject));

  @override
  _OrdersViewObject get _value => super._value as _OrdersViewObject;

  @override
  $Res call({
    Object? dateRange = freezed,
  }) {
    return _then(_OrdersViewObject(
      dateRange == freezed
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as PickerDateRange,
    ));
  }
}

/// @nodoc

class _$_OrdersViewObject implements _OrdersViewObject {
  _$_OrdersViewObject(this.dateRange);

  @override
  final PickerDateRange dateRange;

  @override
  String toString() {
    return 'OrdersViewObject(dateRange: $dateRange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OrdersViewObject &&
            (identical(other.dateRange, dateRange) ||
                const DeepCollectionEquality()
                    .equals(other.dateRange, dateRange)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(dateRange);

  @JsonKey(ignore: true)
  @override
  _$OrdersViewObjectCopyWith<_OrdersViewObject> get copyWith =>
      __$OrdersViewObjectCopyWithImpl<_OrdersViewObject>(this, _$identity);
}

abstract class _OrdersViewObject implements OrdersViewObject {
  factory _OrdersViewObject(PickerDateRange dateRange) = _$_OrdersViewObject;

  @override
  PickerDateRange get dateRange => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrdersViewObjectCopyWith<_OrdersViewObject> get copyWith =>
      throw _privateConstructorUsedError;
}
