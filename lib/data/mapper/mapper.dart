import 'package:cma_admin/app/constant.dart';
import 'package:cma_admin/app/extensions.dart';
import 'package:cma_admin/data/responses/responses.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';

const EMPTY = "";
const ZERO = 0;
const FALSE = false;
const ZEROD = 0.0;
Color COLOR = ColorManager.white;

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
        this?.active.orFalse() ?? FALSE,
        HexColor.fromHex("#${this?.color?.orEmpty() ?? EMPTY}"),
        Constant.ImageUrl + (this?.image?.orEmpty() ?? EMPTY),
        this?.label?.orEmpty() ?? EMPTY);
  }
}

extension SupplementResponseExtension on SupplementResponse? {
  Supplement toDomain() {
    return Supplement(
      this?.id?.orZero() ?? ZERO,
      this?.createdAt?.orEmpty() ?? EMPTY,
      this?.deletedAt?.orEmpty() ?? EMPTY,
      this?.modifiedAt?.orEmpty() ?? EMPTY,
      this?.active.orFalse() ?? FALSE,
      HexColor.fromHex("#${this?.color?.orEmpty() ?? EMPTY}"),
      Constant.ImageUrl + (this?.image?.orEmpty() ?? EMPTY),
      this?.title?.orEmpty() ?? EMPTY,
      this?.price?.orZeroD() ?? ZEROD,
    );
  }
}

extension ProductResponseExtension on ProductResponse? {
  Product toDomain() {
    return Product(
      this?.id?.orZero() ?? ZERO,
      this?.createdAt?.orEmpty() ?? EMPTY,
      this?.deletedAt?.orEmpty() ?? EMPTY,
      this?.modifiedAt?.orEmpty() ?? EMPTY,
      this?.active.orFalse() ?? FALSE,
      HexColor.fromHex("#${this?.color?.orEmpty() ?? EMPTY}"),
      Constant.ImageUrl + (this?.image?.orEmpty() ?? EMPTY),
      this?.title?.orEmpty() ?? EMPTY,
      this?.price?.orZeroD() ?? ZEROD,
      this?.category?.toDomain(),
      this?.supplements?.toDomain(),
    );
  }
}

extension ListCategoryResponseExtension on List<CategoryResponse>? {
  List<Category> toDomain() {
    List<Category>? categories =
        (this?.map((category) => category.toDomain()) ?? Iterable.empty())
            .cast<Category>()
            .toList();

    return categories;
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

extension ListProductResponseExtension on List<ProductResponse>? {
  List<Product> toDomain() {
    List<Product>? products =
        (this?.map((product) => product.toDomain()) ?? Iterable.empty())
            .cast<Product>()
            .toList();

    return products;
  }
}

extension ListSupplementResponseExtension on List<SupplementResponse>? {
  List<Supplement> toDomain() {
    List<Supplement> supplements =
        (this?.map((supplement) => supplement.toDomain()) ?? Iterable.empty())
            .cast<Supplement>()
            .toList();

    return supplements;
  }
}
