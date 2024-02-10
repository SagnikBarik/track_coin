import 'package:flutter/material.dart';

import 'package:track_coin/models/expense_model.dart';
import 'package:track_coin/widgets/expenses_list/expense_item.dart';

class ExpensesHistory extends StatelessWidget {
  const ExpensesHistory({
    super.key,
    required this.allExpenses,
    required this.onRemoveExpense,
  });

  final List<Expense> allExpenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: allExpenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(allExpenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(allExpenses[index]);
        },
        child: ExpenseItem(allExpenses[index]),
      ),
    );
  }
}
