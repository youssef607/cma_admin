import 'dart:typed_data';

import 'package:cma_admin/app/enum.dart';
import 'package:flutter/material.dart';

import 'package:cma_admin/data/mapper/mapper.dart';

class User {
  int id;
  String createdAt;
  String deletedAt;
  String modifiedAt;
  bool active;
  String image;
  String name;
  String role;
  String userName;

  User(
    this.id,
    this.createdAt,
    this.deletedAt,
    this.modifiedAt,
    this.active,
    this.image,
    this.name,
    this.role,
    this.userName,
  );

  factory User.empty() =>
      User(ZERO, EMPTY, EMPTY, EMPTY, true, EMPTY, EMPTY, EMPTY, EMPTY);
}

class Category {
  int id;
  String createdAt;
  String deletedAt;
  String modifiedAt;
  bool active;
  Color color;
  String image;
  String label;
  int orderNumber;

  Category(
    this.id,
    this.createdAt,
    this.deletedAt,
    this.modifiedAt,
    this.active,
    this.color,
    this.image,
    this.label,
    this.orderNumber
  );
}

class Product {
  int id;
  String createdAt;
  String deletedAt;
  String modifiedAt;
  bool active;
  Color color;
  String image;
  String title;
  int orderNumber;
  double price;
  Category? category;
  List<Supplement>? supplements;

  Product(
      this.id,
      this.createdAt,
      this.deletedAt,
      this.modifiedAt,
      this.active,
      this.color,
      this.image,
      this.title,
      this.orderNumber,
      this.price,
      this.category,
      this.supplements);
}

class Supplement {
  int id;
  String createdAt;
  String deletedAt;
  String modifiedAt;
  bool active;
  Color color;
  String image;
  String title;
  double price;
  int orderNumber;

  Supplement(
    this.id,
    this.createdAt,
    this.deletedAt,
    this.modifiedAt,
    this.active,
    this.color,
    this.image,
    this.title,
    this.price,
    this.orderNumber
  );
}

class PickerFile {
  Uint8List byte;
  String extensions;
  PickerFile(this.byte, this.extensions);
}

class OrderProdcut {
  Product? product;
  List<Supplement>? supplements;
  int quantity;
  double amount;

  OrderProdcut(
    this.product,
    this.supplements,
    this.quantity,
    this.amount,
  );

  String supplementsString() {
    String supps = EMPTY;
    for (var i = 0; i < supplements!.length; i++) {
      if (i == 0) {
        supps += supplements![i].title;
      } else {
        supps += "," + supplements![i].title;
      }
    }
    return supps;
  }
}

class OrderModel {
  int id;
  String createdAt;
  String deletedAt;
  String modifiedAt;
  bool active;
  OrderStatus status;
  List<OrderProdcut>? items;
  double totalAmount;
  int itemsNumber;
  User? waiter;

  OrderModel(
      this.id,
      this.createdAt,
      this.deletedAt,
      this.modifiedAt,
      this.active,
      this.status,
      this.items,
      this.totalAmount,
      this.itemsNumber,
      this.waiter);

  factory OrderModel.empty() => OrderModel(
      0, EMPTY, EMPTY, EMPTY, false, OrderStatus.INPROGRESS, [], ZEROD, ZERO, User.empty());
}

class StatusCount {
  int done;
  int inprogress;
  int canceled;

  StatusCount(
    this.done,
    this.inprogress,
    this.canceled,
  );
}

class Waiter {
  int id;
  String name;
  String image;
  int inprogress;
  int done;
  int canceled;
  double amount;

  Waiter(
    this.id,
    this.name,
    this.image,
    this.inprogress,
    this.done,
    this.canceled,
    this.amount,
  );
}

class AllWaitersInsights {
  StatusCount? statusCount;
  
  double totalAmount;

  List<Waiter>? waiters;

  AllWaitersInsights(
    this.statusCount,
    this.totalAmount,
    this.waiters,
  );
}

class WaiterInsights {
  Waiter? waiter;
  
  List<TimeInsights>? timeInsights;

  WaiterInsights(
    this.waiter,
    this.timeInsights
  );
}

class TimeInsights {
  String time;
  int inprogress;
  int done;
  int canceled;
  double amount;

  TimeInsights(
    this.time,
    this.inprogress,
    this.done,
    this.canceled,
    this.amount,
  );
}

class CategoryCount {
  int id;
  Color color;
  String label;
  int quantity;
  CategoryCount(this.id,this.color,this.label,this.quantity);
}

class ProductCount {
  int id;
  Color color;
  String title;
  int categoryId;
  int quantity;
  ProductCount(this.id,this.color,this.title,this.categoryId,this.quantity);
}

class HomeData {
  StatusCount? statusCount;
  List<OrderModel>? lastOrders;
  double totalAmount;
  List<Waiter>? waiters;
  List<TimeInsights>? hoursStatistics;
  List<CategoryCount>? categoryCounts;
  List<ProductCount>? productCounts;
  
  HomeData(
    this.statusCount,
    this.lastOrders,
    this.totalAmount,
    this.waiters,
    this.hoursStatistics,
    this.categoryCounts,
    this.productCounts,
  );
}

class OrdersInsights {
  StatusCount? statusCount;
  List<TimeInsights>? timeInsights;
  double totalAmount;
  int totalCount;
  List<OrderModel>? orders;

  OrdersInsights(
    this.statusCount,
    this.timeInsights,
    this.totalAmount,
    this.totalCount,
    this.orders,
  );
}

class SignInData {
  String token;
  User? user;

  SignInData(this.token, this.user);
}
