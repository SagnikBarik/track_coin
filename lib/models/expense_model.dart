import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.MMMEd();

const uuid = Uuid();

enum Category {grocery, work, shopping, food, travelling, entertainment}

const categoryIcons = {
  Category.food : Icons.lunch_dining_rounded,
  Category.shopping : Icons.shopping_cart_rounded,
  Category.entertainment : Icons.theaters_rounded,
  Category.travelling : Icons.airplanemode_active_rounded,
  Category.work : Icons.work_rounded,
  Category.grocery : Icons.store_rounded,
};

const categoryColors = {
  Category.food : [Color.fromARGB(255, 20, 175, 118) ,Color.fromARGB(255, 207, 250, 233)],
  Category.shopping : [Color.fromARGB(255, 252, 175, 23), Color.fromARGB(255, 252, 238, 212)],
  Category.entertainment : [Color.fromARGB(255, 252, 60, 75) ,Color.fromARGB(255, 254, 214, 215)],
  Category.travelling : [Color.fromARGB(255, 75, 159, 255), Color.fromARGB(255, 202, 227, 255)],
  Category.work : [Color.fromARGB(255, 127, 61, 255) ,Color.fromARGB(255, 238, 230, 254)],
  Category.grocery : [Color.fromARGB(255, 255, 119, 0), Color.fromARGB(255, 255, 227, 190)]
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
