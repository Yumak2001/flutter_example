import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:flutter/material.dart';

import 'on_boarding_card.dart';

class GoButton extends StatelessWidget {
  final Function onTap;

  const GoButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: OnBoardingCard(
        child: Center(
          child: Text(
            "Поехали".toUpperCase(),
            style: TextStylesApp.drukTextCyr500(32, lineHeight: 1.2),
          ),
        ),
        isWithShadow: false,
      ),
    );
  }
}
