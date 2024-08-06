import 'package:fast_app_base/common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_utils/get_utils.dart';

abstract mixin class StockPercentageDataProvider {

  int get currentPrice;
  int get yesterdayClosePrice;

  String get todayPercentage =>
      "$symbol${((currentPrice - yesterdayClosePrice) / yesterdayClosePrice * 100).toPrecision(2)}%";

  bool get isPlus => currentPrice > yesterdayClosePrice;

  bool get isSame => currentPrice == yesterdayClosePrice;

  String get symbol => isSame ? "" : isPlus ? "+" : "";

  Color getPriceColor(BuildContext context) => isSame ? context.appColors.lessImportant: isPlus ? context.appColors.plus : context.appColors.minus;

}