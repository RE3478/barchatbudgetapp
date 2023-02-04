import 'dart:math';

import 'package:getx_state_management/models/categories.dart';
import 'package:getx_state_management/models/expensies.dart';

final rand = Random();

final List<double> weekelyExpenditure = [
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
];

generateExpensies() {
  List<Expensies> expense = [
    Expensies(name: 'Item 0', cost: rand.nextDouble() * 90),
    Expensies(name: 'Item 1', cost: rand.nextDouble() * 90),
    Expensies(name: 'Item 2', cost: rand.nextDouble() * 90),
    Expensies(name: 'Item 3', cost: rand.nextDouble() * 90),
    Expensies(name: 'Item 4', cost: rand.nextDouble() * 90),
    Expensies(name: 'Item 5', cost: rand.nextDouble() * 90),
  ];
  return expense;
}

List<Categories> category = [
  Categories(name: 'Food', maxAmount: 450, expensies: generateExpensies()),
  Categories(name: 'Clothing', maxAmount: 500, expensies: generateExpensies()),
  Categories(name: 'Utilities', maxAmount: 600, expensies: generateExpensies()),
  Categories(
      name: 'Entertainment', maxAmount: 330, expensies: generateExpensies()),
  Categories(
      name: 'Transportation', maxAmount: 500, expensies: generateExpensies()),
  Categories(name: 'Housing', maxAmount: 1000, expensies: generateExpensies()),
];
