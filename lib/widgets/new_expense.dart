import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:track_coin/models/expense_model.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({
    super.key,
    required this.onAddExpense,
  });

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.grocery;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final bool isAmountInvalid = (enteredAmount == null || enteredAmount <= 0);
    if (_titleController.text.trim().isEmpty ||
        isAmountInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Please make sure all entered value was valid.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  Color getChipColor(Category a, Category b) {
    if (Theme.of(context).brightness == Brightness.dark) {
      if (a == b) {
        return Colors.black;
      } else {
        return Colors.white;
      }
    } else {
      if (a == b) {
        return Colors.white;
      } else {
        return Colors.black;
      }
    }
  }

  @override
  Widget build(context) {
    return Padding(
        padding: EdgeInsets.only(
            top: 0,
            right: 20,
            left: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.clear_rounded),
                  style: IconButton.styleFrom(
                    padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
                  ),
                ),
              ],
            ),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                label: Text('Title'),
                hintText: 'Carrots',
                hintStyle: TextStyle(
                    color: Color.fromARGB(255, 171, 171, 171),
                    fontWeight: FontWeight.normal),
                contentPadding: EdgeInsets.only(top: 0.0, bottom: 0.0),
              ),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                prefixText: '\u{20B9} ',
                hintText: '0.00',
                hintStyle: TextStyle(
                    color: Color.fromARGB(255, 171, 171, 171),
                    fontWeight: FontWeight.normal),
                label: Text('Amount'),
                contentPadding: EdgeInsets.only(top: 0.0, bottom: 0.0),
              ),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            const Text('Select Date'),
            TextButton.icon(
              onPressed: _presentDatePicker,
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              icon: const Icon(Icons.calendar_today_rounded),
              label: Text(
                _selectedDate == null
                    ? 'MM/DD/YYYY'
                    : formatter.format(_selectedDate!),
              ),
            ),
            const SizedBox(height: 10),
            const Text('Select Category'),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: List<Widget>.generate(
                Category.values.length,
                (int option) {
                  return ChoiceChip(
                    selectedColor: Theme.of(context).brightness == Brightness.dark? Colors.white : Colors.black,
                    selected: _selectedCategory == Category.values[option],
                    showCheckmark: false,
                    label: Text(
                      toBeginningOfSentenceCase(
                          Category.values[option].toString().split('.').last),
                      style: TextStyle(
                        color: getChipColor(_selectedCategory, Category.values[option])
                      ),
                    ),
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedCategory =
                            (selected ? Category.values[option] : null)!;
                      });
                    },
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitExpenseData,
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40)),
              child: const Text('Add Expense'),
            ),
            const SizedBox(height: 20),
          ],
        ));
  }
}
