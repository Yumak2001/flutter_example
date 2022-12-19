import 'package:faneron_mobile/src/common/controller/app_bar_menu.dart';
import 'package:faneron_mobile/src/common/controller/focus_text_field.dart';
import 'package:faneron_mobile/src/common/controller/scrolls.dart';
import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';
import 'package:faneron_mobile/src/core/presentation/screens/home/home.dart';
import 'package:faneron_mobile/src/extension/home_screens.dart';
import 'package:faneron_mobile/src/resource/keys.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationMenuWidget extends StatelessWidget {
  const BottomNavigationMenuWidget({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ConstantsApp.bottomNavBarHeight(context),
      alignment: Alignment.topCenter,
      color: ColorsApp.bottomNavigationBackground,
      child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        return Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: AnimatedContainer(
                duration: ConstantsApp.durationBottomMenuAnimation,
                margin: EdgeInsets.only(
                    left: ConstantsApp.bottomNavBarItemWidth(context) * state.currentHomePage.index,
                    right: ConstantsApp.bottomNavBarItemWidth(context) * (4 - state.currentHomePage.index)),
                width: ConstantsApp.bottomNavBarItemWidth(context),
                height: ConstantsApp.bottomNavBarItemActiveHeight,
                color: ColorsApp.bottomNavigationActive,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (HomeScreens screen in HomeScreens.values)
                  GestureDetector(
                    onTap: () => _onTapItem(screen.index, context),
                    child: Container(
                      key: HomePageKeys.bottomNavMenuItem(screen.toString()),
                      width: ConstantsApp.bottomNavBarItemWidth(context),
                      height: ConstantsApp.bottomNavBarHeight(null) - ConstantsApp.bottomNavBarItemActiveHeight,
                      padding: EdgeInsets.only(bottom: 5),
                      color: ColorsApp.bottomNavigationBackground,
                      child: Center(
                        key: HomePageKeys.bottomNavMenuItem(screen.toString()),
                        child: (screen.index == 0)
                            ? SvgPicture.asset(
                                AppPicture.homeIcon,
                                height: ConstantsApp.bottomNavBarItemIconSize,
                                width: ConstantsApp.bottomNavBarItemIconSize,
                                color: (state.currentHomePage == screen)
                                    ? ColorsApp.bottomNavigationActive
                                    : ColorsApp.bottomNavigationInActive,
                              )
                            : Icon(
                                screen.toIcon,
                                size: ConstantsApp.bottomNavBarItemIconSize,
                                color: (state.currentHomePage == screen)
                                    ? ColorsApp.bottomNavigationActive
                                    : ColorsApp.bottomNavigationInActive,
                              ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        );
      }),
    );
  }

  void _onTapItem(int index, BuildContext context) {
    context.read<FocusTextFieldProvider>().unFocusAll();
    context.read<AppBarMenuShowController>().setHomePagesPosition(index);
    BlocProvider.of<HomeCubit>(context).onTapBottomMenu(index);
    switch (index) {
      case 0:
        context.read<ScrollProvider>().mainPageSetScroll(0);
        break;
      case 1:
        context.read<ScrollProvider>().laboratoryPageSetScroll(0);
        break;
      case 3:
        context.read<ScrollProvider>().expositionPageScroll(0);
        break;
      case 4:
        context.read<ScrollProvider>().profilePageScroll(0);
    }
  }
}
