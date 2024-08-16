import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedAppBar extends StatefulWidget {
  final String title;
  final ScrollController scrollController;
  final AnimationController animationController;

  const AnimatedAppBar(this.title,
      {required this.scrollController,
      super.key,
      required this.animationController});

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  Duration get duration => 250.ms;
  double scrollPosition = 0;
  late Animation<double> animation = CurvedAnimation(
      parent: widget.animationController, curve: Curves.bounceInOut);

  @override
  void initState() {
    widget.animationController.addListener((){
      setState(() {
        //build 함수가 재실행됨.
      });
    });
    widget.scrollController.addListener(() {
      setState(() {
        scrollPosition = widget.scrollController.position.pixels;
      });
    });
    super.initState();
  }

  bool get isTriggerd => scrollPosition > 80;

  bool get isNotTriggerd => !isTriggerd;

  double getValue(double initial, double target) {
    if (isTriggerd) {
      return target;
    }
    double fraction = scrollPosition / 80;
    return initial + (target - initial) * fraction;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.appColors.appBackground,
      child: SafeArea(
        child: Stack(children: [
          AnimatedContainer(
            duration: duration,
            padding:
                EdgeInsets.only(left: getValue(20, 50), top: getValue(50, 15)),
            child: AnimatedDefaultTextStyle(
                duration: duration,
                style: TextStyle(
                    fontSize: isNotTriggerd ? 30 : 18,
                    fontWeight: FontWeight.bold),
                child: widget.title.text.white.bold.make()),
          ),
          Tap(
            onTap: () {
              Nav.pop(context);
            },
            child: const Arrow(
              direction: AxisDirection.left,
              color: Colors.white,
            ),
          ).p20(),
          Positioned(
            left: animation.value * 200,
            child: TweenAnimationBuilder<Color?>(
              tween: ColorTween(begin: Colors.green, end: Colors.orange),
              duration: 1000.ms,
              builder: (context, value, child) => Image.asset(
                "$basePath/icon/map_point.png",
                height: 60,
                color: value,
                colorBlendMode: BlendMode.modulate,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
