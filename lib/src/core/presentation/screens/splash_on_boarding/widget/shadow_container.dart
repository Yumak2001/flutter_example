import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';

class OnBoardingShadowContainer extends StatelessWidget {
  final Widget child;

  const OnBoardingShadowContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: ColorsApp.gradient3.withOpacity(0.4),
          blurRadius: 40,
          offset: Offset(0, 4),
        )
      ]),
      child: child,
    );
  }
}
