import 'package:flutter/material.dart';

import 'package:track_coin/models/expense_model.dart';
import 'package:track_coin/widgets/expenses_list/expense_item.dart';

class ExpensesHistory extends StatelessWidget {
  const ExpensesHistory({
    super.key,
    required this.allExpenses,
  });

  final List<Expense> allExpenses;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: allExpenses.length,
      itemBuilder: (ctx, index) => ExpenseItem(allExpenses[index]),
    );
  }
}
