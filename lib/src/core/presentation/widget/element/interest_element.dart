import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileInterestElement extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function() onTap;

  ProfileInterestElement({
    required this.title,
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            onTap.call();
          },
          child: Container(
            margin: EdgeInsets.only(top: 8, bottom: 8, left: 5, right: 5),
            height: 42,
            padding: EdgeInsets.only(left: 22, right: 22, bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
              border: Border.all(
                  color: (isActive)
                      ? ColorsApp.borderAccent
                      : ColorsApp.borderDark,
                  width: 2),
            ),
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStylesApp.drukTextCyr500(
                18,
                lineHeight: 1.35,
                color: isActive ? ColorsApp.textAccent : ColorsApp.textDark,
              ),
            ),
          ),
        ),
        if (isActive)
          Positioned(
            bottom: 4,
            right: 1,
            child: Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                color: ColorsApp.borderAccent,
                borderRadius: BorderRadius.circular(9),
              ),
              padding: EdgeInsets.only(left: 4.5, right: 4.5),
              child: SvgPicture.asset(
                AppPicture.itemBoxActive,
                color: ColorsApp.borderLight,
              ),
            ),
          ),
      ],
    );
  }
}
