import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

import '../vo/vo_stock.dart';

class StockItem extends StatelessWidget {
  final Stock stock;

  const StockItem(this.stock, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.appColors.appBackground,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          width10,
          Image.asset(
            stock.stockImagePath,
            width: 50,
          ),
          width20,
          (stock.name).text.size(20).bold.white.make(),
          emptyExpanded,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              stock.todayPercentage.text.color(stock.getPriceColor(context)).make(),
              "${stock.currentPrice}원".text.color(context.appColors.lessImportant).make()
            ],
          )
        ],
      ),
    );
  }
}
