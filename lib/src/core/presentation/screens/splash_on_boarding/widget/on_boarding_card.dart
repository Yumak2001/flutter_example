import 'package:faneron_mobile/src/core/presentation/screens/splash_on_boarding/widget/gradient.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';

class OnBoardingCard extends StatelessWidget {
  final Widget child;
  final bool isWithShadow;

  const OnBoardingCard({
    Key? key,
    required this.child,
    this.isWithShadow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 352,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        gradient: linearGradient(),
        boxShadow: [
          if (isWithShadow)
            BoxShadow(
              color: ColorsApp.gradient3.withOpacity(0.4),
              blurRadius: 40,
              offset: Offset(0, 4),
            )
        ],
      ),
      child: Container(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 32,
          bottom: 32,
        ),
        decoration: BoxDecoration(
          color: ColorsApp.backgroundItem,
        ),
        child: child,
      ),
    );
  }
}
