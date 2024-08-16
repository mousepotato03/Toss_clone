import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_text_watching_bear.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:fast_app_base/screen/notification/w_notification_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:nav/enum/enum_nav_ani.dart';

class NumberDialog extends DialogWidget<int?> {
  NumberDialog({
    super.key,
    super.animation = NavAni.Fade,
    super.barrierDismissible = false,
  });

  @override
  State<NumberDialog> createState() => _NumberDialogState();
}

class _NumberDialogState extends DialogState<NumberDialog> {
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final numberFocus = FocusNode();
  final passwordFocus = FocusNode();
  final textBearController = TextWatchingBearController();

  bool check = false;
  bool handsUp = false;
  double look = 0.0;

  @override
  void initState() {
    numberController.addListener(() {
      setState(() {
        look = numberController.text.length.toDouble() * 1.5;
        debugPrint("look: $look");
      });
    });

    numberFocus.addListener(() {
      setState(() {
        check = numberFocus.hasFocus;
        debugPrint("check: $check");
      });
    });

    passwordFocus.addListener(() {
      setState(() {
        handsUp = passwordFocus.hasFocus;
        debugPrint("handsUp: $handsUp");
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedContainer(
            child: Column(
              children: [
                SizedBox(
                  width: 230,
                  height: 230,
                  child: TextWatchingBear(
                    check: check,
                    handsUp: handsUp,
                    look: look,
                    controller: textBearController,
                  ),
                ),
                "숫자를 입력해 주세요".text.white.make(),
                TextField(
                  focusNode: numberFocus,
                  controller: numberController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                ),
                TextField(
                  focusNode: passwordFocus,
                  obscureText: true,
                  controller: passwordController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                ),
                RoundButton(
                    text: "완료",
                    onTap: () async {
                      final text = numberController.text;
                      try {
                        int number = int.parse(text);
                        textBearController.runSuccessAnimation();
                        await sleepAsync(1500.ms);
                        widget.hide(number);
                      } catch (e) {
                        textBearController.runFailAnimation();
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
