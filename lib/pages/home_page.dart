import 'package:flutter/material.dart';
import 'package:getx_state_management/datas/data_values.dart';
import 'package:getx_state_management/models/categories.dart';
import 'package:getx_state_management/models/expensies.dart';
import 'package:getx_state_management/pages/category_page.dart';
import 'package:getx_state_management/wigets/bar_chart.dart';
import 'package:getx_state_management/wigets/colorHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            forceElevated: true,
            floating: true,
            pinned: true,
            expandedHeight: 100.0,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                size: 30.0,
              ),
            ),
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Budget Auditing'),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 30.0,
                ),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 1 + category.length,
              (context, index) {
                if (index == 0) {
                  return Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 6)
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: BarChartValue(expenses: weekelyExpenditure),
                  );
                } else {
                  final Categories categories = category[index - 1];
                  double totalExpenses = 0;
                  // ignore: avoid_function_literals_in_foreach_calls
                  categories.expensies.forEach((Expensies expensies) {
                    totalExpenses += expensies.cost;
                  });
                  return _buildCategories(categories, totalExpenses);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories(Categories categories, double totalExpenses) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => CategoryPage(categories: categories))),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        height: 100.0,
        width: double.infinity,
        decoration:
            BoxDecoration(color: Colors.grey.shade100, boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          )
        ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  categories.name,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$${(categories.maxAmount - totalExpenses).toStringAsFixed(2)} / \$${categories.maxAmount}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            LayoutBuilder(
              builder: ((BuildContext p0, BoxConstraints p1) {
                final double maxBarWidth = p1.maxWidth;
                final double percentage =
                    (categories.maxAmount - totalExpenses) /
                        categories.maxAmount;
                double barWide = percentage * maxBarWidth;
                if (barWide < 0) {
                  barWide = 0;
                }
                return Stack(
                  children: [
                    Container(
                      height: 20.0,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(16.0)),
                    ),
                    Container(
                      height: 20.0,
                      width: barWide,
                      decoration: BoxDecoration(
                          color: gainColor(context, percentage),
                          borderRadius: BorderRadius.circular(16.0)),
                    ),
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
