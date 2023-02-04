import 'package:flutter/material.dart';
import 'package:getx_state_management/models/categories.dart';

class CategoryPage extends StatefulWidget {
  final Categories categories;
  const CategoryPage({super.key, required this.categories});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    double totalAmountExp = 0;
    for (var expense in widget.categories.expensies) {
      totalAmountExp += expense.cost;
    }
    final double remaining = widget.categories.maxAmount - totalAmountExp;
    final double percentage = remaining / widget.categories.maxAmount;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categories.name),
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 30.0,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(20.0),
            height: 250.0,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 6.0),
                ]),
            child: Center(
              child: Text(
                '\$${remaining.toStringAsFixed(2)} / \$${widget.categories.maxAmount}',
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      )),
    );
  }
}
