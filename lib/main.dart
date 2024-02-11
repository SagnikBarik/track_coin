import 'package:flutter/material.dart';

import 'package:track_coin/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        cardTheme: const CardTheme().copyWith(
          color: const Color.fromARGB(255, 247, 247, 247),
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 112, 222, 165),
            foregroundColor: Colors.black,
          ),
        ),
      ),
      home: Expenses(),
    ),
  );
}
