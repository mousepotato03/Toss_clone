import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';


class Line extends StatelessWidget {
  const Line({
    Key? key,
    this.color,
    this.width = 1,
    this.margin,
  }) : super(key: key);

  final Color? color;
  final EdgeInsets? margin;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      color: color ?? context.appColors.divider,
      width: width,
    );
  }
}
