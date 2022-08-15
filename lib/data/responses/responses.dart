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

  @JsonKey(name: "username")
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
   
  @JsonKey(name: "orderNumber") 
  int? orderNumber;

  CategoryResponse(
    this.color,
    this.image,
    this.label,
    this.orderNumber
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

  @JsonKey(name: "orderNumber") 
  int? orderNumber;

  @JsonKey(name: "price")
  double? price;

  @JsonKey(name: "category")
  CategoryResponse? category;

  @JsonKey(name: "supplements")
  List<SupplementResponse>? supplements;

  ProductResponse(this.color, this.image, this.title,this.orderNumber,this.price, this.category,
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

  @JsonKey(name: "orderNumber") 
  int? orderNumber;

  SupplementResponse(
    this.color,
    this.image,
    this.title,
    this.price,
    this.orderNumber
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

  @JsonKey(name: "amount")
  double? amount;

  OrderProdcutResponse(
    this.product,
    this.supplements,
    this.quantity,
    this.amount,
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

  @JsonKey(name: "totalAmount")
  double? totalAmount;

  @JsonKey(name: "itemsNumber")
  int? itemsNumber;

  @JsonKey(name: "waiter")
  UserResponse? waiter;

  OrderResponse(this.status, this.items, this.totalAmount, this.itemsNumber,
      this.waiter);

  // from json
  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}

@JsonSerializable()
class StatusCountResponse {
  @JsonKey(name: "done")
  int? done;

  @JsonKey(name: "canceled")
  int? canceled;

  @JsonKey(name: "inprogress")
  int? inprogress;

  StatusCountResponse(this.done,this.canceled,this.inprogress);

  // from json
  factory StatusCountResponse.fromJson(Map<String, dynamic> json) =>
      _$StatusCountResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$StatusCountResponseToJson(this);
}

@JsonSerializable()
class WaiterResponse {
  @JsonKey(name: "id")
  int? id;
  
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "inprogress")
  int? inprogress;

  @JsonKey(name: "done")
  int? done;

  @JsonKey(name: "canceled")
  int? canceled;

  @JsonKey(name: "amount")
  double? amount;

  WaiterResponse(this.id,this.name,this.image,this.inprogress,this.done,this.canceled,this.amount);

  // from json
  factory WaiterResponse.fromJson(Map<String, dynamic> json) =>
      _$WaiterResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$WaiterResponseToJson(this);
}

@JsonSerializable()
class AllWaitersInsightsResponse {
  @JsonKey(name: "statusCount")
  StatusCountResponse? statusCount;
  
  @JsonKey(name: "totalAmount")
  double? totalAmount;

  @JsonKey(name: "waiters")
  List<WaiterResponse>? waiters;

  AllWaitersInsightsResponse(
    this.statusCount,
    this.totalAmount,
    this.waiters,
  );

  // from json
  factory AllWaitersInsightsResponse.fromJson(Map<String, dynamic> json) =>
      _$AllWaitersInsightsResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$AllWaitersInsightsResponseToJson(this);
}


@JsonSerializable()
class WaiterInsightsResponse {
  @JsonKey(name: "waiter")
  WaiterResponse? waiter;
  
  
  @JsonKey(name: "timeInsights")
  List<TimeInsightsResponse>? timeInsights;

  WaiterInsightsResponse(
    this.waiter,
    this.timeInsights
  );

  // from json
  factory WaiterInsightsResponse.fromJson(Map<String, dynamic> json) =>
      _$WaiterInsightsResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$WaiterInsightsResponseToJson(this);
}


@JsonSerializable()
class CategoryCountResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "color")
  String? color;

  @JsonKey(name: "label")
  String? label;

  @JsonKey(name: "quantity")
  int? quantity;

  CategoryCountResponse(this.id, this.color, this.label, this.quantity);

  // from json
  factory CategoryCountResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryCountResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$CategoryCountResponseToJson(this);
}

@JsonSerializable()
class ProductCountResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "color")
  String? color;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "categoryId")
  int? categoryId;

  @JsonKey(name: "quantity")
  int? quantity;

  ProductCountResponse(this.id, this.color, this.title,this.categoryId,this.quantity);

  // from json
  factory ProductCountResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductCountResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$ProductCountResponseToJson(this);
}

@JsonSerializable()
class TimeInsightsResponse {
  
  @JsonKey(name: "time")
  String? time;

  @JsonKey(name: "inprogress")
  int? inprogress;

  @JsonKey(name: "done")
  int? done;

  @JsonKey(name: "canceled")
  int? canceled;

  @JsonKey(name: "amount")
  double? amount;

  TimeInsightsResponse(
    this.time,
    this.inprogress,
    this.done,
    this.canceled,
    this.amount,
  );

  // from json
  factory TimeInsightsResponse.fromJson(Map<String, dynamic> json) =>
      _$TimeInsightsResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$TimeInsightsResponseToJson(this);
}

@JsonSerializable()
class HomeResponse {

  @JsonKey(name: "lastOrders")
  List<OrderResponse>? lastOrders;

  @JsonKey(name: "statusCount")
  StatusCountResponse? statusCount;
  
  @JsonKey(name: "totalAmount")
  double? totalAmount;

  @JsonKey(name: "waiters")
  List<WaiterResponse>? waiters;
  
  @JsonKey(name: "hoursInsights")
  List<TimeInsightsResponse>? hoursInsights;

  @JsonKey(name: "categoryCounts")
  List<CategoryCountResponse>? categoryCounts;

  @JsonKey(name: "productCounts")
  List<ProductCountResponse>? productCounts;

  HomeResponse(this.statusCount,this.lastOrders,this.totalAmount,this.waiters,this.hoursInsights, this.categoryCounts,this.productCounts);

  // from json
  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}

@JsonSerializable()
class OrdersInsightsResponse {
  @JsonKey(name: "statusCount")
  StatusCountResponse? statusCount;
  
  @JsonKey(name: "timeInsights")
  List<TimeInsightsResponse>? timeInsights;

  @JsonKey(name: "totalAmount")
  double? totalAmount;

  @JsonKey(name: "totalCount")
  int? totalCount;

  @JsonKey(name: "orders")
  List<OrderResponse>? orders;

  OrdersInsightsResponse(
    this.statusCount,
    this.timeInsights,
    this.totalAmount,
    this.totalCount,
    this.orders,
  );

  // from json
  factory OrdersInsightsResponse.fromJson(Map<String, dynamic> json) =>
      _$OrdersInsightsResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$OrdersInsightsResponseToJson(this);

}
