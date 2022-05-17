import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

class BaseResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "createdAt")
  String? createdAt;

  @JsonKey(name: "deletedAt")
  String? deletedAt;

  @JsonKey(name: "modifiedAt")
  String? modifiedAt;

  @JsonKey(name: "active")
  bool? active;
}

@JsonSerializable()
class SignInResponse {
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  UserResponse? user;

  SignInResponse(this.token, this.user);

// from json
  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}

@JsonSerializable()
class UserResponse extends BaseResponse {
  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "password")
  String? password;

  @JsonKey(name: "role")
  String? role;

  @JsonKey(name: "userName")
  String? userName;

  UserResponse(this.image, this.name, this.password, this.role, this.userName);

  // from json
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class CategoryResponse extends BaseResponse {
  @JsonKey(name: "color")
  String? color;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "label")
  String? label;

  CategoryResponse(
    this.color,
    this.image,
    this.label,
  );

  // from json
  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}

@JsonSerializable()
class ProductResponse extends BaseResponse {
  @JsonKey(name: "color")
  String? color;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "price")
  double? price;

  @JsonKey(name: "category")
  CategoryResponse? category;

  @JsonKey(name: "supplements")
  List<SupplementResponse>? supplements;

  ProductResponse(this.color, this.image, this.title, this.price, this.category,
      this.supplements);

  // from json
  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable()
class SupplementResponse extends BaseResponse {
  @JsonKey(name: "color")
  String? color;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "price")
  double? price;

  SupplementResponse(
    this.color,
    this.image,
    this.title,
    this.price,
  );

  // from json
  factory SupplementResponse.fromJson(Map<String, dynamic> json) =>
      _$SupplementResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$SupplementResponseToJson(this);
}

@JsonSerializable()
class OrderProdcutResponse {
  @JsonKey(name: "product")
  ProductResponse? product;

  @JsonKey(name: "supplements")
  List<SupplementResponse>? supplements;

  @JsonKey(name: "quantity")
  int? quantity;

  @JsonKey(name: "totalPrice")
  double? totalPrice;

  OrderProdcutResponse(
    this.product,
    this.supplements,
    this.quantity,
    this.totalPrice,
  );

  // from json
  factory OrderProdcutResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderProdcutResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$OrderProdcutResponseToJson(this);
}

@JsonSerializable()
class OrderResponse extends BaseResponse {
  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "items")
  List<OrderProdcutResponse>? items;

  @JsonKey(name: "totalOrderPrice")
  double? totalOrderPrice;

  @JsonKey(name: "itemsNumber")
  int? itemsNumber;

  @JsonKey(name: "waiter")
  UserResponse? waiter;

  OrderResponse(this.status, this.items, this.totalOrderPrice, this.itemsNumber,
      this.waiter);

  // from json
  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}

@JsonSerializable()
class StatiqueResponse {
  @JsonKey(name: "amount")
  double? amount;

  @JsonKey(name: "numOfDoneOrders")
  int? numOfDoneOrders;

  @JsonKey(name: "numOfInProgressOrders")
  int? numOfInProgressOrders;

  @JsonKey(name: "numOfOrders")
  int? numOfOrders;

  StatiqueResponse(this.amount, this.numOfDoneOrders,
      this.numOfInProgressOrders, this.numOfOrders);

  // from json
  factory StatiqueResponse.fromJson(Map<String, dynamic> json) =>
      _$StatiqueResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$StatiqueResponseToJson(this);
}

@JsonSerializable()
class WaiterResponse {
  @JsonKey(name: "waiter")
  UserResponse? waiter;

  @JsonKey(name: "ordersCount")
  int? ordersCount;

  WaiterResponse(this.waiter, this.ordersCount);

  // from json
  factory WaiterResponse.fromJson(Map<String, dynamic> json) =>
      _$WaiterResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$WaiterResponseToJson(this);
}

@JsonSerializable()
class CategoryCountResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "color")
  String? color;

  @JsonKey(name: "label")
  String? label;

  @JsonKey(name: "itemsCount")
  int? itemsCount;

  CategoryCountResponse(this.id, this.color, this.label, this.itemsCount);

  // from json
  factory CategoryCountResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryCountResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$CategoryCountResponseToJson(this);
}

@JsonSerializable()
class HomeResponse {
  @JsonKey(name: "statique")
  StatiqueResponse? statique;

  @JsonKey(name: "orders")
  List<OrderResponse>? orders;

  @JsonKey(name: "waiters")
  List<WaiterResponse>? waiters;

  @JsonKey(name: "categoryCounts")
  List<CategoryCountResponse>? categoryCounts;

  HomeResponse(this.statique, this.orders, this.waiters, this.categoryCounts);

  // from json
  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}
