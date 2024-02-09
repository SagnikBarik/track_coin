import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category {food, shopping, entertainment, travel, work}

const categoryIcons = {
  Category.food : Icons.lunch_dining_rounded,
  Category.shopping : Icons.shopping_bag_rounded,
  Category.entertainment : Icons.theaters_rounded,
  Category.travel : Icons.airplanemode_active_rounded,
  Category.work : Icons.laptop_windows_rounded
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
