import 'package:cma_admin/app/constant.dart';
import 'package:cma_admin/app/extensions.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/data/responses/responses.dart';
import 'package:cma_admin/domain/model/model.dart';
<<<<<<< HEAD
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
=======
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';
>>>>>>> origin/add-product

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

extension CategoryResponseExtension on CategoryResponse? {
  Category toDomain() {
    return Category(
        this?.id?.orZero() ?? ZERO,
        dateFormat(this?.createdAt?.orEmpty() ?? EMPTY),
        this?.deletedAt?.orEmpty() ?? EMPTY,
        this?.modifiedAt?.orEmpty() ?? EMPTY,
        this?.active.orFalse() ?? FALSE,
        HexColor.fromHex("#${this?.color?.orEmpty() ?? EMPTY}"),
        Constant.ImageUrl + (this?.image?.orEmpty() ?? EMPTY),
        this?.label?.orEmpty() ?? EMPTY);
  }
}

extension ProductResponseExtension on ProductResponse? {
  Product toDomain() {
    return Product(
      this?.id?.orZero() ?? ZERO,
      dateFormat(this?.createdAt?.orEmpty() ?? EMPTY),
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

extension SupplementResponseExtension on SupplementResponse? {
  Supplement toDomain() {
    return Supplement(
      this?.id?.orZero() ?? ZERO,
      dateFormat(this?.createdAt?.orEmpty() ?? EMPTY),
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

extension OrderProductResponseExtension on OrderProdcutResponse? {
  OrderProdcut toDomain() {
    return OrderProdcut(
      this?.product?.toDomain(),
      this?.supplements?.toDomain(),
      this?.quantity?.orZero() ?? ZERO,
      this?.totalPrice?.orZeroD() ?? ZEROD,
    );
  }
}

extension OrderResponseExtension on OrderResponse? {
  OrderModel toDomain() {
    return OrderModel(
        this?.id?.orZero() ?? ZERO,
        this?.createdAt?.orEmpty() ?? EMPTY,
        this?.deletedAt?.orEmpty() ?? EMPTY,
        this?.modifiedAt?.orEmpty() ?? EMPTY,
        this?.active.orFalse() ?? FALSE,
        this?.status.orEmpty() ?? EMPTY,
        this?.items?.toDomain(),
        this?.totalOrderPrice.orZeroD() ?? ZEROD,
        this?.itemsNumber?.orZero() ?? ZERO,
        this?.waiter?.toDomain());
  }
}

extension StatiqueResponseExtension on StatiqueResponse? {
  Statique toDomain() {
    return Statique(
      this?.amount?.orZeroD() ?? ZEROD,
      this?.numOfDoneOrders?.orZero() ?? ZERO,
      this?.numOfInProgressOrders?.orZero() ?? ZERO,
      this?.numOfOrders?.orZero() ?? ZERO,
    );
  }
}

extension WaiterResponseExtension on WaiterResponse? {
  Waiter toDomain() {
    return Waiter(this?.waiter?.toDomain(), this?.ordersCount.orZero() ?? ZERO);
  }
}

extension CategoryCountResponseExtension on CategoryCountResponse? {
  CategoryCount toDomain() {
    return CategoryCount(
        this?.id?.orZero() ?? ZERO,
        HexColor.fromHex(this?.color?.orEmpty() ?? "F9F9F9"),
        this?.label.orEmpty() ?? EMPTY,
        this?.itemsCount?.orZero() ?? ZERO,);
  }
}

extension HomeResponseExtension on HomeResponse? {
  HomeData toDomain() {
    return HomeData(this?.statique?.toDomain(), this?.orders?.toDomain(),
        this?.waiters?.toDomain(),this?.categoryCounts?.toDomain());
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

<<<<<<< HEAD
extension ListCategoryResponseExtension on List<CategoryResponse>? {
  List<Category> toDomain() {
    List<Category>? categories =
        (this?.map((category) => category.toDomain()) ?? Iterable.empty())
            .cast<Category>()
            .toList();

    return categories;
  }
}

=======
>>>>>>> origin/add-product
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
<<<<<<< HEAD

extension ListOrderProductResponseExtension on List<OrderProdcutResponse>? {
  List<OrderProdcut> toDomain() {
    List<OrderProdcut> orderProducts =
        (this?.map((orderProduct) => orderProduct.toDomain()) ??
                Iterable.empty())
            .cast<OrderProdcut>()
            .toList();

    return orderProducts;
  }
}

extension ListOrderResponseExtension on List<OrderResponse>? {
  List<OrderModel> toDomain() {
    List<OrderModel> orders =
        (this?.map((order) => order.toDomain()) ?? Iterable.empty())
            .cast<OrderModel>()
            .toList();

    return orders;
  }
}

extension ListWaiterResponseExtension on List<WaiterResponse>? {
  List<Waiter> toDomain() {
    List<Waiter> waiters =
        (this?.map((waiter) => waiter.toDomain()) ?? Iterable.empty())
            .cast<Waiter>()
            .toList();

    return waiters;
  }
}


extension ListCategoryCountResponseExtension on List<CategoryCountResponse>? {
  List<CategoryCount> toDomain() {
    List<CategoryCount> categoryCount =
        (this?.map((categoryCount) => categoryCount.toDomain()) ?? Iterable.empty())
            .cast<CategoryCount>()
            .toList();

    return categoryCount;
  }
}
=======
>>>>>>> origin/add-product
