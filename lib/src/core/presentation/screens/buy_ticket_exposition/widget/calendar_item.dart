import 'package:faneron_mobile/src/resource/icons.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalendarButton extends StatelessWidget {
  const CalendarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 11),
        color: ColorsApp.backgroundItemActive,
        height: 53,
        width: 54,
        child: Column(
          children: [
            Icon(AppIcons.calendar, size: 21, color: ColorsApp.backgroundItemInActive),
            SizedBox(height: 3),
            SvgPicture.asset(AppPicture.caretDown, width: 10),
          ],
        ));
  }
}
