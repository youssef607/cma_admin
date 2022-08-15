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
    json['username'] as String?,
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
      'username': instance.userName,
    };

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) {
  return CategoryResponse(
    json['color'] as String?,
    json['image'] as String?,
    json['label'] as String?,
    json['orderNumber'] as int?,
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
      'orderNumber': instance.orderNumber,
    };

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) {
  return ProductResponse(
    json['color'] as String?,
    json['image'] as String?,
    json['title'] as String?,
    json['orderNumber'] as int?,
    (json['price'] as num?)?.toDouble(),
    json['category'] == null
        ? null
        : CategoryResponse.fromJson(json['category'] as Map<String, dynamic>),
    (json['supplements'] as List<dynamic>?)
        ?.map((e) => SupplementResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  )
    ..id = json['id'] as int?
    ..createdAt = json['createdAt'] as String?
    ..deletedAt = json['deletedAt'] as String?
    ..modifiedAt = json['modifiedAt'] as String?
    ..active = json['active'] as bool?;
}

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'deletedAt': instance.deletedAt,
      'modifiedAt': instance.modifiedAt,
      'active': instance.active,
      'color': instance.color,
      'image': instance.image,
      'title': instance.title,
      'orderNumber': instance.orderNumber,
      'price': instance.price,
      'category': instance.category,
      'supplements': instance.supplements,
    };

SupplementResponse _$SupplementResponseFromJson(Map<String, dynamic> json) {
  return SupplementResponse(
    json['color'] as String?,
    json['image'] as String?,
    json['title'] as String?,
    (json['price'] as num?)?.toDouble(),
    json['orderNumber'] as int?,
  )
    ..id = json['id'] as int?
    ..createdAt = json['createdAt'] as String?
    ..deletedAt = json['deletedAt'] as String?
    ..modifiedAt = json['modifiedAt'] as String?
    ..active = json['active'] as bool?;
}

Map<String, dynamic> _$SupplementResponseToJson(SupplementResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'deletedAt': instance.deletedAt,
      'modifiedAt': instance.modifiedAt,
      'active': instance.active,
      'color': instance.color,
      'image': instance.image,
      'title': instance.title,
      'price': instance.price,
      'orderNumber': instance.orderNumber,
    };

OrderProdcutResponse _$OrderProdcutResponseFromJson(Map<String, dynamic> json) {
  return OrderProdcutResponse(
    json['product'] == null
        ? null
        : ProductResponse.fromJson(json['product'] as Map<String, dynamic>),
    (json['supplements'] as List<dynamic>?)
        ?.map((e) => SupplementResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['quantity'] as int?,
    (json['amount'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$OrderProdcutResponseToJson(
        OrderProdcutResponse instance) =>
    <String, dynamic>{
      'product': instance.product,
      'supplements': instance.supplements,
      'quantity': instance.quantity,
      'amount': instance.amount,
    };

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) {
  return OrderResponse(
    json['status'] as String?,
    (json['items'] as List<dynamic>?)
        ?.map((e) => OrderProdcutResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['totalAmount'] as num?)?.toDouble(),
    json['itemsNumber'] as int?,
    json['waiter'] == null
        ? null
        : UserResponse.fromJson(json['waiter'] as Map<String, dynamic>),
  )
    ..id = json['id'] as int?
    ..createdAt = json['createdAt'] as String?
    ..deletedAt = json['deletedAt'] as String?
    ..modifiedAt = json['modifiedAt'] as String?
    ..active = json['active'] as bool?;
}

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'deletedAt': instance.deletedAt,
      'modifiedAt': instance.modifiedAt,
      'active': instance.active,
      'status': instance.status,
      'items': instance.items,
      'totalAmount': instance.totalAmount,
      'itemsNumber': instance.itemsNumber,
      'waiter': instance.waiter,
    };

StatusCountResponse _$StatusCountResponseFromJson(Map<String, dynamic> json) {
  return StatusCountResponse(
    json['done'] as int?,
    json['canceled'] as int?,
    json['inprogress'] as int?,
  );
}

Map<String, dynamic> _$StatusCountResponseToJson(
        StatusCountResponse instance) =>
    <String, dynamic>{
      'done': instance.done,
      'canceled': instance.canceled,
      'inprogress': instance.inprogress,
    };

WaiterResponse _$WaiterResponseFromJson(Map<String, dynamic> json) {
  return WaiterResponse(
    json['id'] as int?,
    json['name'] as String?,
    json['image'] as String?,
    json['inprogress'] as int?,
    json['done'] as int?,
    json['canceled'] as int?,
    (json['amount'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$WaiterResponseToJson(WaiterResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'inprogress': instance.inprogress,
      'done': instance.done,
      'canceled': instance.canceled,
      'amount': instance.amount,
    };

AllWaitersInsightsResponse _$AllWaitersInsightsResponseFromJson(Map<String, dynamic> json) {
  return AllWaitersInsightsResponse(
    json['statusCount'] == null
        ? null
        : StatusCountResponse.fromJson(
            json['statusCount'] as Map<String, dynamic>),
    json['totalAmount'] as double?,
    (json['waiters'] as List<dynamic>?)
        ?.map((e) => WaiterResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AllWaitersInsightsResponseToJson(AllWaitersInsightsResponse instance) =>
    <String, dynamic>{
      'statusCount': instance.statusCount,
      'totalAmount': instance.totalAmount,
      'waiters': instance.waiters,
    };

WaiterInsightsResponse _$WaiterInsightsResponseFromJson(Map<String, dynamic> json) {
  return WaiterInsightsResponse(
    json['waiter'] == null
        ? null
        : WaiterResponse.fromJson(
            json['waiter'] as Map<String, dynamic>),
    (json['timeInsights'] as List<dynamic>?)
        ?.map((e) => TimeInsightsResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$WaiterInsightsResponseToJson(WaiterInsightsResponse instance) =>
    <String, dynamic>{
      'waiter': instance.waiter,
      'timeInsights': instance.timeInsights
    };

TimeInsightsResponse _$TimeInsightsResponseFromJson(Map<String, dynamic> json) {
  return TimeInsightsResponse(
    json['time'] as String?,
    json['inprogress'] as int?,
    json['done'] as int?,
    json['canceled'] as int?,
    (json['amount'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$TimeInsightsResponseToJson(TimeInsightsResponse instance) =>
    <String, dynamic>{
      'time': instance.time,
      'inprogress': instance.inprogress,
      'done': instance.done,
      'canceled': instance.canceled,
      'amount': instance.amount,
    };

CategoryCountResponse _$CategoryCountResponseFromJson(
    Map<String, dynamic> json) {
  return CategoryCountResponse(
    json['id'] as int?,
    json['color'] as String?,
    json['label'] as String?,
    json['quantity'] as int?,
  );
}

Map<String, dynamic> _$CategoryCountResponseToJson(
        CategoryCountResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'color': instance.color,
      'label': instance.label,
      'quantity': instance.quantity,
    };

ProductCountResponse _$ProductCountResponseFromJson(Map<String, dynamic> json) {
  return ProductCountResponse(
    json['id'] as int?,
    json['color'] as String?,
    json['title'] as String?,
    json['categoryId'] as int?,
    json['quantity'] as int?,
  );
}

Map<String, dynamic> _$ProductCountResponseToJson(
        ProductCountResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'color': instance.color,
      'title': instance.title,
      'categoryId': instance.categoryId,
      'quantity': instance.quantity,
    };

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) {
  return HomeResponse(
    json['statusCount'] == null
        ? null
        : StatusCountResponse.fromJson(
            json['statusCount'] as Map<String, dynamic>),
    (json['lastOrders'] as List<dynamic>?)
        ?.map((e) => OrderResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['totalAmount'] as num?)?.toDouble(),
    (json['waiters'] as List<dynamic>?)
        ?.map((e) => WaiterResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['hoursInsights'] as List<dynamic>?)
        ?.map((e) => TimeInsightsResponse.fromJson(e as Map<String, dynamic>))
        .toList(), 
    (json['categoryCounts'] as List<dynamic>?)
        ?.map((e) => CategoryCountResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['productCounts'] as List<dynamic>?)
        ?.map((e) => ProductCountResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'lastOrders': instance.lastOrders,
      'statusCount': instance.statusCount,
      'totalAmount': instance.totalAmount,
      'waiters': instance.waiters,
      'hoursInsights': instance.hoursInsights,
      'categoryCounts': instance.categoryCounts,
      'productCounts': instance.productCounts,
    };

OrdersInsightsResponse _$OrdersInsightsResponseFromJson(
    Map<String, dynamic> json) {
  return OrdersInsightsResponse(
    json['statusCount'] == null
        ? null
        : StatusCountResponse.fromJson(
            json['statusCount'] as Map<String, dynamic>),
    (json['timeInsights'] as List<dynamic>?)
        ?.map((e) => TimeInsightsResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['totalAmount'] as num?)?.toDouble(),
    json['totalCount'] as int?,
    (json['orders'] as List<dynamic>?)
        ?.map((e) => OrderResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$OrdersInsightsResponseToJson(
        OrdersInsightsResponse instance) =>
    <String, dynamic>{
      'statusCount': instance.statusCount,
      'timeInsights': instance.timeInsights,
      'totalAmount': instance.totalAmount,
      'totalCount': instance.totalCount,
      'orders': instance.orders,
    };
