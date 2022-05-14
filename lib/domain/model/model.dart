import 'dart:typed_data';

import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:flutter/material.dart';

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

  Category(
    this.id,
    this.createdAt,
    this.deletedAt,
    this.modifiedAt,
    this.active,
    this.color,
    this.image,
    this.label,
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
  double totalPrice;

  OrderProdcut(
    this.product,
    this.supplements,
    this.quantity,
    this.totalPrice,
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
  String status;
  List<OrderProdcut>? items;
  double totalOrderPrice;
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
      this.totalOrderPrice,
      this.itemsNumber,
      this.waiter);

  factory OrderModel.empty() => OrderModel(
      0, EMPTY, EMPTY, EMPTY, false, EMPTY, [], ZEROD, ZERO, User.empty());
}

class Statique {
  double amount;
  int numOfDoneOrders;
  int numOfInProgressOrders;
  int numOfOrders;

  Statique(this.amount, this.numOfDoneOrders, this.numOfInProgressOrders,
      this.numOfOrders);
}

class Waiter {
  User? waiter;
  int ordersCount;

  Waiter(this.waiter,this.ordersCount);
}


class CategoryCount {
  int id;
  Color color;
  String label;
  int itemsCount;
  CategoryCount(this.id,this.color,this.label,this.itemsCount);
}
class HomeData {
  Statique? statique;
  List<OrderModel>? orders;
  List<Waiter>? waiters;
  List<CategoryCount>? categoryCounts;
  HomeData(this.statique, this.orders,this.waiters,this.categoryCounts);
}

class SignInData {
  String token;
  User? user;

  SignInData(this.token, this.user);
}
