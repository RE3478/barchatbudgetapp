import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BarChartValue extends StatelessWidget {
  List<double> expenses;
  BarChartValue({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    double mostExpense = 0;
    for (var priceValue in expenses) {
      if (priceValue > mostExpense) {
        mostExpense = priceValue;
      }
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 10.0),
        const Center(
          child: Text(
            'Weekly Expenditures',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2),
          ),
        ),
        const SizedBox(
          height: 05,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back, size: 30)),
              const Expanded(
                child: Center(
                  child: Text(
                    'January 29, 2023 - Febuary 28, 2023',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, letterSpacing: 1.2),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward, size: 30)),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Bar(
                label: 'Sun',
                expenseValue: expenses[0],
                mostExpenses: mostExpense),
            Bar(
                label: 'Mon',
                expenseValue: expenses[1],
                mostExpenses: mostExpense),
            Bar(
                label: 'Tue',
                expenseValue: expenses[2],
                mostExpenses: mostExpense),
            Bar(
                label: 'Wed',
                expenseValue: expenses[3],
                mostExpenses: mostExpense),
            Bar(
                label: 'Thu',
                expenseValue: expenses[4],
                mostExpenses: mostExpense),
            Bar(
                label: 'Fri',
                expenseValue: expenses[5],
                mostExpenses: mostExpense),
            Bar(
                label: 'Sat',
                expenseValue: expenses[6],
                mostExpenses: mostExpense),
          ],
        )
      ],
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double expenseValue;
  final double mostExpenses;
  final double _maxBarHeight = 150.0;
  const Bar({
    super.key,
    required this.label,
    required this.expenseValue,
    required this.mostExpenses,
  });

  @override
  Widget build(BuildContext context) {
    final barHeight = expenseValue / mostExpenses * _maxBarHeight;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 2, 2),
          child: Text(
            '\$${expenseValue.toStringAsFixed(2)}',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 0, 2, 2),
          child: Container(
            height: barHeight,
            width: 18.0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 2, 4),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
          ),
        ),
      ],
    );
  }
}
