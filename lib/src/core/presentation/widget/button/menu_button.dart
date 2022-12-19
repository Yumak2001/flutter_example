import 'package:faneron_mobile/src/common/controller/app_bar_menu.dart';
import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class AppBarMenuButtonAnimationWidget extends StatefulWidget {
  @override
  _AppBarMenuButtonAnimationWidgetState createState() =>
      _AppBarMenuButtonAnimationWidgetState();
}

class _AppBarMenuButtonAnimationWidgetState
    extends State<AppBarMenuButtonAnimationWidget>
    with TickerProviderStateMixin {
  final BoxDecoration decorationItemLeft = BoxDecoration(
    color: ColorsApp.appBarIconColor,
    borderRadius: BorderRadius.horizontal(left: Radius.circular(5)),
  );
  final BoxDecoration decorationItemRight = BoxDecoration(
    color: ColorsApp.appBarIconColor,
    borderRadius: BorderRadius.horizontal(right: Radius.circular(5)),
  );

  late AnimationController animationController1;
  late AnimationController animationController2;
  late AnimationController animationController3;
  late AnimationController animationController4;

  @override
  void initState() {
    super.initState();
    animationController1 = new AnimationController(
      value: 0,
      vsync: this,
      duration: ConstantsApp.durationAnimationMenu,
    );
    animationController2 = new AnimationController(
      value: 0,
      vsync: this,
      duration: ConstantsApp.durationAnimationMenu,
    );
    animationController3 = new AnimationController(
      value: 0,
      vsync: this,
      duration: ConstantsApp.durationAnimationMenu,
    );
    animationController4 = new AnimationController(
      value: 0,
      vsync: this,
      duration: ConstantsApp.durationAnimationMenu,
    );

    context.read<AppBarMenuShowController>().menuView.listen((event) {
      if (event) {
        animationController1.animateTo(math.pi / 4);
        animationController2.animateTo(math.pi / 4);
        animationController3.animateTo(math.pi / 4);
        animationController4.animateTo(math.pi / 4);
      } else {
        animationController1.animateTo(0);
        animationController2.animateTo(0);
        animationController3.animateTo(0);
        animationController4.animateTo(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: context.read<AppBarMenuShowController>().menuView,
        builder: (context, snapshot) {
          bool isMenu = snapshot.data ?? false;
          return Container(
            height: 42,
            width: 42,
            color: Colors.transparent,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedPositioned(
                  duration: ConstantsApp.durationAnimationMenu,
                  top: (isMenu) ? 5 : 7.5,
                  left: (isMenu) ? 6.5 : 4,
                  child: AnimatedBuilder(
                    animation: animationController1,
                    child: AnimatedContainer(
                      duration: ConstantsApp.durationAnimationMenu,
                      height: 3.5,
                      width: (isMenu) ? 15.8 : 13.6,
                      decoration: decorationItemLeft,
                    ),
                    builder: (context, widget) {
                      return Transform.rotate(
                        angle: animationController1.value,
                        alignment: Alignment.centerLeft,
                        child: widget,
                      );
                    },
                  ),
                ),
                AnimatedPositioned(
                  duration: ConstantsApp.durationAnimationMenu,
                  bottom: (isMenu) ? 5 : 7.5,
                  left: (isMenu) ? 6.5 : 4,
                  child: AnimatedBuilder(
                    animation: animationController2,
                    child: AnimatedContainer(
                      duration: ConstantsApp.durationAnimationMenu,
                      height: 3.5,
                      width: (isMenu) ? 15.8 : 13.6,
                      decoration: decorationItemLeft,
                    ),
                    builder: (context, widget) {
                      return Transform.rotate(
                        angle: -animationController2.value,
                        alignment: Alignment.centerLeft,
                        child: widget,
                      );
                    },
                  ),
                ),
                AnimatedPositioned(
                  duration: ConstantsApp.durationAnimationMenu,
                  top: (isMenu) ? 5 : 7.5,
                  right: (isMenu) ? 6.5 : 4,
                  child: AnimatedBuilder(
                    animation: animationController3,
                    child: AnimatedContainer(
                      duration: ConstantsApp.durationAnimationMenu,
                      height: 3.5,
                      width: (isMenu) ? 15.8 : 13.6,
                      decoration: decorationItemRight,
                    ),
                    builder: (context, widget) {
                      return Transform.rotate(
                        angle: -animationController3.value,
                        alignment: Alignment.centerRight,
                        child: widget,
                      );
                    },
                  ),
                ),
                AnimatedPositioned(
                  duration: ConstantsApp.durationAnimationMenu,
                  bottom: (isMenu) ? 5 : 7.5,
                  right: (isMenu) ? 6.5 : 4,
                  child: AnimatedBuilder(
                    animation: animationController4,
                    child: AnimatedContainer(
                      duration: ConstantsApp.durationAnimationMenu,
                      height: 3.5,
                      width: (isMenu) ? 15.8 : 13.6,
                      decoration: decorationItemRight,
                    ),
                    builder: (context, widget) {
                      return Transform.rotate(
                        angle: animationController4.value,
                        alignment: Alignment.centerRight,
                        child: widget,
                      );
                    },
                  ),
                ),
                AnimatedContainer(
                  duration: ConstantsApp.durationAnimationMenu,
                  height: 3.5,
                  width: (isMenu) ? 2 : 27,
                  decoration: BoxDecoration(
                    color: ColorsApp.appBarIconColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
