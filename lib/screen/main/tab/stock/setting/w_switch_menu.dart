import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class SwitchMenu extends StatelessWidget {
  final String title;
  final bool isOn;
  final ValueChanged<bool> onTap;

  const SwitchMenu(this.title, this.isOn, {super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        title.text.white.bold.make(),
        emptyExpanded,
        Switch(value: isOn, onChanged: onTap)
      ],
    ).p20();
  }
}
