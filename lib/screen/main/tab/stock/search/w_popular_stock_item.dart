import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo/vo_popular_stock.dart';
import 'package:flutter/material.dart';

class PopularStockItem extends StatelessWidget {
  final PopularStock stock;
  final int number;

  const PopularStockItem(
      {super.key, required this.stock, required this.number});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 40, child: number.text.size(16).bold.white.make()),
        stock.name.text.bold.size(16).white.make(),
        emptyExpanded,
        stock.todayPercentage.text.color(stock.getPriceColor(context)).make()
      ],
    ).pSymmetric(v:25);
  }
}
