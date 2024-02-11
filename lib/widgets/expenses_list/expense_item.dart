import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:track_coin/models/expense_model.dart';
import 'package:track_coin/widgets/expenses_list/expense_icon.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Row(
            children: [
              ExpenseIcon(expense.category),
              const SizedBox(width: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expense.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  //const SizedBox(height: 1),
                  Text(
                    toBeginningOfSentenceCase(expense.category.name),
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 150, 150, 150)),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '- \u{20B9}${expense.amount.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    expense.formattedDate,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 150, 150, 150)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
