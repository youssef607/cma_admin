import 'package:cma_admin/app/constant.dart';
import 'package:cma_admin/app/enum.dart';
import 'package:cma_admin/app/extensions.dart';
import 'package:cma_admin/app/functions.dart';
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
        dateFormat2(this?.createdAt?.orEmpty() ?? EMPTY),
        this?.deletedAt?.orEmpty() ?? EMPTY,
        this?.modifiedAt?.orEmpty() ?? EMPTY,
        this?.active?.orFalse() ?? FALSE,
        Constant.ImageUrl + (this?.image?.orEmpty() ?? EMPTY),
        this?.name?.orEmpty() ?? EMPTY,
        this?.role?.orEmpty() ?? EMPTY,
        this?.userName?.orEmpty() ?? EMPTY);
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
        this?.label?.orEmpty() ?? EMPTY,
        this?.orderNumber?.orZero() ?? ZERO
        );
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
      this?.orderNumber?.orZero() ?? ZERO,
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
      this?.orderNumber?.orZero() ?? ZERO
    );
  }
}

extension OrderProductResponseExtension on OrderProdcutResponse? {
  OrderProdcut toDomain() {
    return OrderProdcut(
      this?.product?.toDomain(),
      this?.supplements?.toDomain(),
      this?.quantity?.orZero() ?? ZERO,
      this?.amount?.orZeroD() ?? ZEROD,
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
        (this?.status.orEmpty() ?? EMPTY).toEnum(),
        this?.items?.toDomain(),
        this?.totalAmount.orZeroD() ?? ZEROD,
        this?.itemsNumber?.orZero() ?? ZERO,
        this?.waiter?.toDomain());
  }
}

extension StatusCountResponseExtension on StatusCountResponse? {
  StatusCount toDomain() {
    return StatusCount(
      this?.done?.orZero() ?? ZERO,
      this?.inprogress?.orZero() ?? ZERO,
      this?.canceled.orZero() ?? ZERO,
    );
  }
}

extension WaiterResponseExtension on WaiterResponse? {
  Waiter toDomain() {
    return Waiter(
      this?.id?.orZero()??ZERO,
      this?.name?.orEmpty()??EMPTY,
      Constant.ImageUrl+(this?.image?.orEmpty()??EMPTY),
      this?.inprogress?.orZero()??ZERO,
      this?.done?.orZero()??ZERO,
      this?.canceled.orZero()??ZERO,
      this?.amount?.orZeroD()??ZEROD,
    );
  }
}

extension AllWaiterinsightsResponseExtension on AllWaitersInsightsResponse? {
  AllWaitersInsights toDomain() {
    return AllWaitersInsights(
      this?.statusCount?.toDomain(),
      this?.totalAmount?.orZeroD()??ZEROD,
      this?.waiters?.toDomain()
    );
  }
}

extension WaiterinsightsResponseExtension on WaiterInsightsResponse? {
  WaiterInsights toDomain() {
    return WaiterInsights(
      this?.waiter?.toDomain(),
      this?.timeInsights?.toDomain()
    );
  }
}

extension TimeInsightsResponseExtension on TimeInsightsResponse? {
  TimeInsights toDomain() {
    return TimeInsights(
      this?.time?.orEmpty()??EMPTY,
      this?.inprogress?.orZero()??ZERO,
      this?.done?.orZero()??ZERO,
      this?.canceled.orZero()??ZERO,
      this?.amount?.orZeroD()??ZEROD,
    );
  }
}

extension CategoryCountResponseExtension on CategoryCountResponse? {
  CategoryCount toDomain() {
    return CategoryCount(
        this?.id?.orZero() ?? ZERO,
        HexColor.fromHex(this?.color?.orEmpty() ?? "F9F9F9"),
        this?.label.orEmpty() ?? EMPTY,
        this?.quantity?.orZero() ?? ZERO,);
  }
}

extension ProductCountResponseExtension on ProductCountResponse? {
  ProductCount toDomain() {
    return ProductCount(
        this?.id?.orZero() ?? ZERO,
        HexColor.fromHex(this?.color?.orEmpty() ?? "F9F9F9"),
        this?.title.orEmpty() ?? EMPTY,
        this?.categoryId.orZero() ?? ZERO,
        this?.quantity?.orZero() ?? ZERO);
  }
}

extension HomeResponseExtension on HomeResponse? {
  HomeData toDomain() {
    return HomeData(
      this?.statusCount?.toDomain(), 
      this?.lastOrders.toDomain(),
      this?.totalAmount?.orZeroD()??ZEROD,
      this?.waiters?.toDomain(),
      this?.hoursInsights?.toDomain(),
      this?.categoryCounts?.toDomain(),
      this?.productCounts?.toDomain());
  }
}

extension OrdersInsightsResponseExtension on OrdersInsightsResponse?{
  OrdersInsights toDomain(){
    return OrdersInsights(
      this?.statusCount?.toDomain(), 
      this?.timeInsights?.toDomain(),
      this?.totalAmount?.orZeroD()??ZEROD, 
      this?.totalCount?.orZero()??ZERO, 
      this?.orders?.toDomain());
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

extension ListHourInsightsResponseExtension on List<TimeInsightsResponse>? {
  List<TimeInsights> toDomain() {
    List<TimeInsights> timeInsights =
        (this?.map((timeInsight) => timeInsight.toDomain()) ?? Iterable.empty())
            .cast<TimeInsights>()
            .toList();

    return timeInsights;
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

extension ListProductCountResponseExtension on List<ProductCountResponse>? {
  List<ProductCount> toDomain() {
    List<ProductCount> productsCount =
        (this?.map((productCount) => productCount.toDomain()) ?? Iterable.empty())
            .cast<ProductCount>()
            .toList();

    return productsCount;
  }
}
