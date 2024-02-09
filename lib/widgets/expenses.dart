import 'package:flutter/material.dart';

import 'package:track_coin/widgets/expenses_list/expenses_history.dart';
import 'package:track_coin/models/expense_model.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpancesState();
  }
}

class _ExpancesState extends State<Expenses> {
  final List<Expense> _registeredExpences = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.29,
      date: DateTime.now(),
      category: Category.entertainment,
    )
  ];

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Coin'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(child: ExpensesHistory(allExpenses: _registeredExpences)),
        ],
      ),
    );
  }
}
