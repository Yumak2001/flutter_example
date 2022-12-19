import 'package:dotted_border/dotted_border.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropCapTextWidget extends StatelessWidget {
  final String text;
  final bool border;
  final bool light;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double size;
  final double dropSize;
  final double dropWith;
  final double dropHeight;
  final EdgeInsets dropPadding;
  final EdgeInsets dropMargin;

  DropCapTextWidget({
    required this.text,
    required this.size,
    required this.dropSize,
    required this.dropWith,
    required this.dropHeight,
    required this.dropPadding,
    required this.dropMargin,
    this.light = true,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.border = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: (!border) ? padding : EdgeInsets.zero,
      child: (border)
          ? DottedBorder(
              color: light
                  ? ColorsApp.textDropBackgroundLight
                  : ColorsApp.textDropBackgroundDark,
              strokeWidth: 1,
              dashPattern: [12, 12],
              padding: padding,
              child: _dropText(),
            )
          : _dropText(),
    );
  }

  DropCapText _dropText() {
    return DropCapText(
      text.substring(1),
      style: TextStylesApp.pragmatica400(
        size,
        lineHeight: 1.35,
        color: light ? ColorsApp.textDropDark : ColorsApp.textDropLight,
      ),
      dropCap: DropCap(
        height: dropHeight + dropMargin.vertical,
        width: dropWith + dropMargin.horizontal,
        child: Container(
          width: dropWith,
          height: dropHeight,
          margin: dropMargin,
          color: light
              ? ColorsApp.textDropBackgroundLight
              : ColorsApp.textDropBackgroundDark,
          alignment: Alignment.center,
          child: Stack(
            children: [
              Positioned(
                top: dropPadding.top,
                left: dropPadding.left,
                right: dropPadding.right,
                child: Center(
                  child: Text(
                    text[0].toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStylesApp.pragmatica400(
                      dropSize,
                      color: light
                          ? ColorsApp.textDropLight
                          : ColorsApp.textDropDark,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
