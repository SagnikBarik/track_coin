import 'package:flutter/material.dart';

import 'package:track_coin/models/expense_model.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Row(
          children: [
            Icon(categoryIcons[expense.category]),
            const SizedBox(width: 25),
            Column(
              children: [
                Text(expense.title),
                const SizedBox(height: 4),
                Text(expense.category.toString()),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                const SizedBox(height: 4),
                Text(expense.formattedDate),
              ],
            )
          ],
        ),
      ),
    );
  }
}
