import 'package:cma_admin/app/constant.dart';
import 'package:cma_admin/app/extensions.dart';
import 'package:cma_admin/data/responses/responses.dart';
import 'package:cma_admin/domain/model/model.dart';

const EMPTY = "";
const ZERO = 0;
const FALSE = false;
const ZEROD = 0.0;

extension UserResponseExtension on UserResponse? {
  User toDomain() {
    return User(
        this?.id?.orZero() ?? ZERO,
        this?.createdAt?.orEmpty() ?? EMPTY,
        this?.deletedAt?.orEmpty() ?? EMPTY,
        this?.modifiedAt?.orEmpty() ?? EMPTY,
        this?.active?.orFalse() ?? FALSE,
        Constant.ImageUrl + (this?.image?.orEmpty() ?? EMPTY),
        this?.name?.orEmpty() ?? EMPTY,
        this?.role?.orEmpty() ?? EMPTY,
        this?.userName?.orEmpty() ?? EMPTY);
  }
}

extension CategoryResponseExtension on CategoryResponse? {
  Category toDomain() {
    return Category(
        this?.id?.orZero() ?? ZERO,
        this?.createdAt?.orEmpty() ?? EMPTY,
        this?.deletedAt?.orEmpty() ?? EMPTY,
        this?.modifiedAt?.orEmpty() ?? EMPTY,
        this?.active?.orFalse() ?? FALSE,
        this?.color.orEmpty() ?? EMPTY,
        Constant.ImageUrl + (this?.image?.orEmpty() ?? EMPTY),
        this?.label?.orEmpty() ?? EMPTY);
  }
}

extension SignInResponseExtension on SignInResponse? {
  SignInData toDomain() {
    return SignInData(this?.token.orEmpty() ?? EMPTY, this?.user?.toDomain());
  }
}

extension ListUserResponseExtension on List<UserResponse>? {
  List<User> toDomain() {
    List<User> users =
        (this?.map((user) => user.toDomain()) ?? Iterable.empty())
            .cast<User>()
            .toList();

    return users;
  }
}
