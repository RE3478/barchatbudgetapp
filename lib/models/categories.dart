import 'package:getx_state_management/models/expensies.dart';

class Categories {
  final String name;
  final double maxAmount;
  final List<Expensies> expensies;

  Categories(
      {required this.name, required this.maxAmount, required this.expensies});
}
