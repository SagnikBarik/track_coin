import 'package:flutter/material.dart';

import 'package:track_coin/widgets/expenses_list/expenses_history.dart';
import 'package:track_coin/models/expense_model.dart';
import 'package:track_coin/widgets/new_expense.dart';

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
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Spotify Premium',
      amount: 15.29,
      date: DateTime.now(),
      category: Category.entertainment,
    ),
    Expense(
      title: 'Dominos',
      amount: 5.49,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Uber',
      amount: 3.99,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'MacBook',
      amount: 1699,
      date: DateTime.now(),
      category: Category.shopping,
    )
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
        action: SnackBarAction(label: 'Undo', onPressed: (){
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
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  @override
  Widget build(context) {
    Widget mainContent = const Center(
      child: Text('No Expences Found'),
    );

    if (_registeredExpences.isNotEmpty) {
      mainContent = ExpensesHistory(
        allExpenses: _registeredExpences,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Coin'),
        actions: [
          IconButton(
            onPressed: _openOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
