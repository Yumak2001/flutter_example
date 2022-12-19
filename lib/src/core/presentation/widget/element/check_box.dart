import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool value;
  final Function(bool) onChangeValue;
  final EdgeInsets margin;
  final double size;
  final Color borderColor;

  CheckBoxWidget({
    Key? key,
    required this.value,
    required this.onChangeValue,
    this.margin = EdgeInsets.zero,
    this.size = 20,
    this.borderColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: GestureDetector(
        onTap: () {
          onChangeValue.call(!value);
        },
        child: Container(
          height: size,
          width: size,
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: ColorsApp.checkBoxBackground,
            border: Border.all(
              color: borderColor,
            ),
          ),
          child: SvgPicture.asset(
            AppPicture.checkBoxIcon,
            fit: BoxFit.fitWidth,
            color:
                value ? ColorsApp.checkBoxActive : ColorsApp.checkBoxInActive,
          ),
        ),
      ),
    );
  }
}
