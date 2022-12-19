import 'package:faneron_mobile/src/common/controller/app_bar_menu.dart';
import 'package:faneron_mobile/src/common/controller/focus_text_field.dart';
import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/widget/button/button.dart';
import 'package:faneron_mobile/src/core/presentation/widget/button/menu_button.dart';
import 'package:faneron_mobile/src/resource/icons.dart';
import 'package:faneron_mobile/src/resource/keys.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainAppBarWidget extends StatelessWidget {
  final String keyPage;
  final String title;
  final bool titleShowScroll;
  final bool showButtonPay;
  final double extentTitleStartShowScroll;
  final Stream<double>? scrollOffsetStream;
  MainAppBarWidget({
    required this.keyPage,
    this.title = '',
    this.titleShowScroll = false,
    this.extentTitleStartShowScroll = 0,
    this.scrollOffsetStream,
    this.showButtonPay = false,
  }) : super(key: HomePageKeys.appBar(keyPage)) {
    if (titleShowScroll) {
      if (scrollOffsetStream == null) {
        throw 'titleShowScroll = true | scrollOffsetStream == null';
      }
    }
  }

  //TODO: isDebug to [false]
  ///Переменная для отображения debugMenu
  final bool isDebug = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ConstantsApp.topViewPadding(context),
      ),
      height: ConstantsApp.appBarHeight(),
      width: double.infinity,
      color: ColorsApp.appBarBackground,
      child: StreamBuilder<bool>(
        stream: context.read<AppBarMenuShowController>().menuView,
        builder: (context, snapshot) {
          bool isMenu = snapshot.data ?? false;
          return Stack(
            children: [
              Positioned(
                top: ConstantsApp.appBarIconPositionTop,
                left: ConstantsApp.appBarIconPositionLeft,
                child: GestureDetector(
                  key: HomePageKeys.appBarMenuButton(keyPage),
                  onTap: () {
                    context.read<FocusTextFieldProvider>().unFocusAll();
                    context.read<AppBarMenuShowController>().showAndCloseMenu();
                  },
                  child: Container(
                    key: HomePageKeys.appBarMenu(keyPage),
                    height: ConstantsApp.appBarIconMenuContainerSize,
                    width: ConstantsApp.appBarIconMenuContainerSize,
                    color: Colors.transparent,
                    child: AppBarMenuButtonAnimationWidget(),
                  ),
                ),
              ),
              showButtonPay
                  ? AnimatedPositioned(
                      duration: ConstantsApp.durationAnimationMenu,
                      right: isMenu ? -145 : 0,
                      top: 0,
                      child: ButtonWidget(
                        title: 'Купить билет',
                        height: 50,
                        wight: 140,
                        border: true,
                        fontSize: 18,
                        light: true,
                        onTap: () {
                          context.read<RouterCubit>().onRouteToBuyTicketExposition();
                        },
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(left: 70, right: 70),
                      child: titleShowScroll
                          ? StreamBuilder<double>(
                              stream: scrollOffsetStream!,
                              builder: (context, snapshot) {
                                double opacity = 0.0;
                                if (snapshot.data != null) {
                                  if (snapshot.data! > extentTitleStartShowScroll) {
                                    if (snapshot.data! < extentTitleStartShowScroll + 85) {
                                      opacity = (snapshot.data! - extentTitleStartShowScroll) / 85;
                                    } else {
                                      opacity = 1.0;
                                    }
                                  }
                                }
                                if (isMenu) {
                                  opacity = 1;
                                }
                                return titleOfOpacity(opacity, (isMenu) ? 'Меню' : title);
                              },
                            )
                          : titleOfOpacity(1, (isMenu) ? 'Меню' : title),
                    ),
              if (showButtonPay && isMenu)
                Padding(
                  padding: EdgeInsets.only(left: 70, right: 70),
                  child: titleOfOpacity(1, 'Меню'),
                ),
              //TODO: Нужно для debug режима
              if (isDebug)
                AnimatedPositioned(
                  duration: ConstantsApp.durationAnimationMenu,
                  top: ConstantsApp.appBarIconPositionTop,
                  right: (isMenu) ? ConstantsApp.appBarIconPositionLeft : -145,
                  child: GestureDetector(
                    onTap: () {
                      context.read<AppBarMenuShowController>().showAndCloseDebugMenu();
                    },
                    child: Container(
                      height: ConstantsApp.appBarIconMenuContainerSize,
                      width: ConstantsApp.appBarIconMenuContainerSize,
                      color: Colors.transparent,
                      child: Icon(
                        AppIcons.layout,
                        size: ConstantsApp.appBarIconMenuSize,
                        color: ColorsApp.appBarIconColor,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget titleOfOpacity(double opacity, String title) {
    return Center(
      child: Text(
        title.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStylesApp.titleStyle(opacity),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
