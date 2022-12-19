import 'package:faneron_mobile/src/common/controller/app_bar_menu.dart';
import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:faneron_mobile/src/core/presentation/widget/button/menu_button.dart';
import 'package:faneron_mobile/src/core/presentation/widget/button/button.dart';
import 'package:faneron_mobile/src/resource/icons.dart';
import 'package:faneron_mobile/src/resource/keys.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SecondAppBarWidget extends StatelessWidget {
  final String keyPage;
  final String title;
  final bool titleShowScroll;
  final double extentTitleStartShowScroll;
  final bool iconBackOrCross;
  final Stream<double>? scrollOffsetStream;
  final Function()? onTapBack;
  SecondAppBarWidget({
    required this.keyPage,
    this.title = '',
    this.titleShowScroll = false,
    this.extentTitleStartShowScroll = 0,
    this.scrollOffsetStream,
    this.onTapBack,
    this.iconBackOrCross = true,
  }) : super(key: HomePageKeys.appBar(keyPage)) {
    if (titleShowScroll) {
      if (scrollOffsetStream == null) {
        throw 'titleShowScroll = true | scrollOffsetStream == null';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ConstantsApp.topViewPadding(context),
      ),
      height: ConstantsApp.appBarHeight(),
      width: double.infinity,
      color: ColorsApp.appBarBackground,
      child: Stack(
        children: [
          Positioned(
            top: 4,
            left: 1,
            child: GestureDetector(
              key: HomePageKeys.appBarMenuButton(keyPage),
              onTap: () {
                if (onTapBack != null) {
                  onTapBack!.call();
                } else {
                  Navigator.pop(context);
                }
              },
              child: Container(
                key: HomePageKeys.appBarMenu(keyPage),
                color: Colors.transparent,
                child: iconBackOrCross
                    ? Icon(
                        AppIcons.caretLeft,
                        size: 42,
                        color: ColorsApp.appBarIconColor,
                      )
                    : Container(
                        height: 42,
                        width: 42,
                        padding: EdgeInsets.all(4),
                        child: SvgPicture.asset(
                          AppPicture.crossIcon,
                          fit: BoxFit.fitWidth,
                          color: ColorsApp.appBarIconColor,
                        ),
                      ),
              ),
            ),
          ),
          Padding(
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
                      return titleOfOpacity(opacity);
                    },
                  )
                : titleOfOpacity(1),
          ),
        ],
      ),
    );
  }

  Widget titleOfOpacity(double opacity) {
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
