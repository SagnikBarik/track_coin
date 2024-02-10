import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.MMMEd();

const uuid = Uuid();

enum Category {food, shopping, entertainment, travel, work}

const categoryIcons = {
  Category.food : Icons.lunch_dining_rounded,
  Category.shopping : Icons.shopping_cart_rounded,
  Category.entertainment : Icons.theaters_rounded,
  Category.travel : Icons.airplanemode_active_rounded,
  Category.work : Icons.work_rounded
};

const categoryColors = {
  Category.food : [Color.fromARGB(255, 20, 175, 118) ,Color.fromARGB(255, 207, 250, 233)],
  Category.shopping : [Color.fromARGB(255, 251, 172, 19), Color.fromARGB(255, 252, 238, 212)],
  Category.entertainment : [Color.fromARGB(255, 252, 60, 75) ,Color.fromARGB(255, 254, 214, 215)],
  Category.travel : [Color.fromARGB(255, 75, 159, 255), Color.fromARGB(255, 196, 224, 255)],
  Category.work : [Color.fromARGB(255, 127, 61, 255) ,Color.fromARGB(255, 238, 230, 254)],
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
