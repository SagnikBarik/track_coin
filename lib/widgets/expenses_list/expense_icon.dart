import 'package:flutter/material.dart';

import 'package:track_coin/models/expense_model.dart';

class ExpenseIcon extends StatelessWidget {
  const ExpenseIcon(this.expenseCategory, {super.key});

  final Category expenseCategory;

  @override
  Widget build(context) {
    return Container(
      width: 45,
      height: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: categoryColors[expenseCategory]![1],
      ),
      child: Icon(
        categoryIcons[expenseCategory],
        color: categoryColors[expenseCategory]![0],
        size: 30
      ),
    );
  }
}
