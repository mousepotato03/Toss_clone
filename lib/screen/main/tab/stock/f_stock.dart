import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_search_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_my_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_todays_discovery.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/w_image_button.dart';

class StockFragment extends StatefulWidget {
  const StockFragment({super.key});

  @override
  State<StockFragment> createState() => _StockFragmentState();
}

class _StockFragmentState extends State<StockFragment> with SingleTickerProviderStateMixin {
  late final tabController = TabController(length: 2, vsync: this);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: context.appColors.appBarBackground,
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            ImageButton(
              imagePath: "$basePath/icon/stock_search.png",
              onTap: () {
                Nav.push(SearchStockScreen());
              },
            ),
            ImageButton(
              imagePath: "$basePath/icon/stock_calendar.png",
              onTap: () {
                context.showSnackbar("캘린더");
              },
            ),
            ImageButton(
              imagePath: "$basePath/icon/stock_settings.png",
              onTap: () {
                context.showSnackbar("설정");
              },
            ),
          ],
        ),
        SliverToBoxAdapter(
            child: Column(
          children: [
            title,
            tabBar,
            if(currentIndex == 0)
              const MyStockFragment()
            else
              const TodaysDiscoveryFragment()
            ,
          ],
        ))
      ],
    );
  }

  Widget get title => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          "토스증권".text.size(24).white.bold.make(),
          width20,
          "S&P 500"
              .text
              .size(13)
              .bold
              .color(context.appColors.lessImportant)
              .make(),
          width10,
          "3,919.29".text.size(13).bold.color(context.appColors.plus).make()
        ],
      ).pOnly(left: 20);

  Widget get tabBar => Column(
        children: [
          TabBar(
            onTap: (index) {
              setState(() => currentIndex = index);
            },
            labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            labelPadding: const EdgeInsets.symmetric(vertical: 20),
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.white,
            controller: tabController,
            tabs: [
              "내 주식".text.white.make(),
              '오늘의 발견'.text.white.make(),
            ],
          ),
          Line(),
        ],
      );
}
