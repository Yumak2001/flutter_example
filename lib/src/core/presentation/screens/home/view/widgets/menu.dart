import 'package:faneron_mobile/src/common/controller/app_bar_menu.dart';
import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/widget/debug.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder<bool>(
          stream: context.read<AppBarMenuShowController>().menuView,
          builder: (context, snapshot) {
            bool isMenu = snapshot.data ?? false;
            return AnimatedPositioned(
              duration: ConstantsApp.durationAnimationMenu,
              top: isMenu ? 0 : -ConstantsApp.mainSize(context).height,
              child: Container(
                height: ConstantsApp.mainSize(context).height,
                width: ConstantsApp.mainSize(context).width,
                color: ColorsApp.backgroundMainPage,
                child: StreamBuilder<bool>(
                  stream: context.read<AppBarMenuShowController>().debugMenuView,
                  builder: (context, snapshot) {
                    bool isDebugMenu = snapshot.data ?? false;
                    if (isDebugMenu) {
                      ///Экран Debug.
                      return Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top,
                          bottom: ConstantsApp.bottomNavBarHeight(context),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            ToolButtons(),
                          ],
                        ),
                      );
                    } else {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 23, vertical: 14),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _itemMenu(
                              'Новости',
                              () => context.read<RouterCubit>().onRouteToNewsList(),
                              context,
                            ),
                            // _itemMenu(
                            //   'Комиксы фанерона',
                            //   () => {
                            //     ///
                            //   },
                            // ),
                            ///Перешло на главную, уточнить нужно еще в меню или нет
                            _itemMenu(
                              'Вопрос - ответ',
                              () => context.read<RouterCubit>().onRouteToQuestionAnswer(),
                              context,
                            ),
                            _itemMenu(
                              'Как добраться',
                              () => context.read<RouterCubit>().onRouteToNavigation(),
                              context,
                            ),
                            _itemMenu(
                              'Контакты',
                              () => context.read<RouterCubit>().onRouteToContacts(),
                              context,
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _itemMenu(String title, Function() callback, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14, bottom: 14),
      child: GestureDetector(
        onTap: () {
          callback.call();
          context.read<AppBarMenuShowController>().closeMenu();
        },
        child: Text(
          title.toUpperCase(),
          style: TextStylesApp.drukTextCyr500(32, lineHeight: 0.85),
          maxLines: 1,
        ),
      ),
    );
  }
}
