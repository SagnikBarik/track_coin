import 'package:flutter/material.dart';

import 'package:track_coin/widgets/expenses_list/expenses_history.dart';
import 'package:track_coin/models/expense_model.dart';
import 'package:track_coin/widgets/new_expense.dart';
import 'package:track_coin/widgets/chart/chart.dart';

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
      title: 'Udemy Course',
      amount: 349,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Spotify Premium',
      amount: 1899,
      date: DateTime.now(),
      category: Category.entertainment,
    ),
    Expense(
      title: 'Dominos',
      amount: 950,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Vegetables',
      amount: 110,
      date: DateTime.now(),
      category: Category.grocery,
    ),
    Expense(
      title: 'Uber',
      amount: 150,
      date: DateTime.now(),
      category: Category.travelling,
    ),
    Expense(
      title: 'Speaker',
      amount: 1599,
      date: DateTime.now(),
      category: Category.shopping,
    ),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpences.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpences.indexOf(expense);
    setState(() {
      _registeredExpences.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense Deleted'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpences.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  void _openOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  @override
  Widget build(context) {
    Widget mainContent = const Center(
      child: Text('No Expenses Found'),
    );

    if (_registeredExpences.isNotEmpty) {
      mainContent = ExpensesHistory(
        allExpenses: _registeredExpences,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('TrackCoin', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),),
        actions: [
          IconButton(
            onPressed: _openOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpences),
          const SizedBox(height: 15),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
