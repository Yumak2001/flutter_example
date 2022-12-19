import 'package:faneron_mobile/src/core/presentation/widget/clipper/button_border.dart';
import 'package:faneron_mobile/src/core/presentation/widget/element/loader.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool active;
  final bool light;
  final bool border;
  final double? height;
  final double? wight;
  final bool loading;
  final EdgeInsets margin;
  final double fontSize;
  final Color? colorTitle;
  final bool gradient;

  ButtonWidget({
    required this.title,
    required this.onTap,
    this.active = true,
    this.light = false,
    this.border = true,
    this.height,
    this.wight,
    this.margin = EdgeInsets.zero,
    this.fontSize = 20,
    this.loading = false,
    this.colorTitle,
    this.gradient = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: GestureDetector(
        onTap: () => (loading || !active) ? null : onTap.call(),
        child: ClipPath(
          clipper: ButtonBorderClipper(),
          child: Container(
            padding: EdgeInsets.all(1),
            height: height,
            width: wight,
            color: border
                ? light
                    ? ColorsApp.backgroundButtonDark
                    : ColorsApp.backgroundButtonLight.withOpacity(active ? 1.0 : 0.5)
                : light
                    ? ColorsApp.backgroundButtonLight
                    : ColorsApp.backgroundButtonDark,
            child: ClipPath(
              clipper: ButtonBorderClipper(),
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: light ? ColorsApp.backgroundButtonLight : ColorsApp.backgroundButtonDark,
                  gradient: gradient ? ColorsApp.gradientBackgroundHorizontal : null,
                ),
                child: ClipPath(
                  clipper: ButtonBorderClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: border
                          ? light
                              ? ColorsApp.backgroundButtonDark
                              : ColorsApp.backgroundButtonLight.withOpacity(active ? 1.0 : 0.5)
                          : light
                              ? ColorsApp.backgroundButtonLight
                              : ColorsApp.backgroundButtonDark,
                    ),
                    padding: EdgeInsets.all(1),
                    child: ClipPath(
                      clipper: ButtonBorderClipper(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: light ? ColorsApp.backgroundButtonLight : ColorsApp.backgroundButtonDark,
                          gradient: gradient ? ColorsApp.gradientBackgroundHorizontal : null,
                        ),
                        child: Center(
                          child: (loading)
                              ? LoaderWidget(
                                  inButton: true,
                                  color: light ? ColorsApp.loaderButtonDark : ColorsApp.loaderButtonLight,
                                )
                              : Text(
                                  title.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: TextStylesApp.drukTextCyr500(
                                    fontSize,
                                    color: colorTitle ??
                                        (light ? ColorsApp.textBlack : ColorsApp.text.withOpacity(active ? 1.0 : 0.5)),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
