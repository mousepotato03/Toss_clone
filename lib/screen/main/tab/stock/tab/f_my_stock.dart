import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/w_interest_stock_list.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/w_long_button.dart';

class MyStockFragment extends StatelessWidget {
  const MyStockFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getMyAccount(context),
        height20,
        getMyStocks(context),
      ],
    );
  }

  Widget getMyAccount(BuildContext context) => Container(
        color: context.appColors.roundedLayoutBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height20,
            "계좌".text.white.make(),
            Row(
              children: [
                "443원".text.white.size(24).bold.make(),
                Arrow(
                  color: Colors.white,
                ),
                emptyExpanded,
                RoundedContainer(
                  child: "채우기".text.white.size(12).make(),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  radius: 8,
                  backgroundColor: context.appColors.buttonBackground,
                )
              ],
            ),
            height30,
            Line(
              color: context.appColors.divider,
            ),
            height10,
            LongButton(title: "주문내역"),
            LongButton(title: "판매수익")
          ],
        ).pSymmetric(h: 20),
      );

  Widget getMyStocks(BuildContext context) => Container(
        color: context.appColors.roundedLayoutBackground,
        child: Column(children: [
          height30,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                '관심주식'.text.white.bold.make(),
                '편집하기'.text.color(context.appColors.lessImportant).make(),
              ],
            ),
          ),
          height20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Tap(
              onTap: (){
                context.showSnackbar("기본");
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "기본".text.white.bold.make(),
                    Arrow(
                      direction: AxisDirection.up,
                    )
                  ],
                ),
              ),
            ),
          ),
          InteresStockList(),
        ]),
      );
}
