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

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) {
  return ProductResponse(
    json['color'] as String?,
    json['image'] as String?,
    json['title'] as String?,
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
    (json['totalPrice'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$OrderProdcutResponseToJson(
        OrderProdcutResponse instance) =>
    <String, dynamic>{
      'product': instance.product,
      'supplements': instance.supplements,
      'quantity': instance.quantity,
      'totalPrice': instance.totalPrice,
    };

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) {
  return OrderResponse(
    json['status'] as String?,
    (json['items'] as List<dynamic>?)
        ?.map((e) => OrderProdcutResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['totalOrderPrice'] as num?)?.toDouble(),
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
      'totalOrderPrice': instance.totalOrderPrice,
      'itemsNumber': instance.itemsNumber,
      'waiter': instance.waiter,
    };

StatiqueResponse _$StatiqueResponseFromJson(Map<String, dynamic> json) {
  return StatiqueResponse(
    (json['amount'] as num?)?.toDouble(),
    json['numOfDoneOrders'] as int?,
    json['numOfInProgressOrders'] as int?,
    json['numOfOrders'] as int?,
  );
}

Map<String, dynamic> _$StatiqueResponseToJson(StatiqueResponse instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'numOfDoneOrders': instance.numOfDoneOrders,
      'numOfInProgressOrders': instance.numOfInProgressOrders,
      'numOfOrders': instance.numOfOrders,
    };

WaiterResponse _$WaiterResponseFromJson(Map<String, dynamic> json) {
  return WaiterResponse(
    json['waiter'] == null
        ? null
        : UserResponse.fromJson(json['waiter'] as Map<String, dynamic>),
    json['ordersCount'] as int?,
  );
}

Map<String, dynamic> _$WaiterResponseToJson(WaiterResponse instance) =>
    <String, dynamic>{
      'waiter': instance.waiter,
      'ordersCount': instance.ordersCount,
    };

CategoryCountResponse _$CategoryCountResponseFromJson(
    Map<String, dynamic> json) {
  return CategoryCountResponse(
    json['id'] as int?,
    json['color'] as String?,
    json['label'] as String?,
    json['itemsCount'] as int?,
  );
}

Map<String, dynamic> _$CategoryCountResponseToJson(
        CategoryCountResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'color': instance.color,
      'label': instance.label,
      'itemsCount': instance.itemsCount,
    };

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) {
  return HomeResponse(
    json['statique'] == null
        ? null
        : StatiqueResponse.fromJson(json['statique'] as Map<String, dynamic>),
    (json['orders'] as List<dynamic>?)
        ?.map((e) => OrderResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['waiters'] as List<dynamic>?)
        ?.map((e) => WaiterResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['categoryCounts'] as List<dynamic>?)
        ?.map((e) => CategoryCountResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'statique': instance.statique,
      'orders': instance.orders,
      'waiters': instance.waiters,
      'categoryCounts': instance.categoryCounts,
    };
