import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';

class ThreeDots extends StatelessWidget {
  final int currentStep;

  const ThreeDots({
    Key? key,
    required this.currentStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (currentStep >= 1 && currentStep <= 3)
      return Row(
        children: [
          AnimatedContainer(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: currentStep == 1 ? ColorsApp.borderAccent : ColorsApp.backgroundItemInActive.withOpacity(0.4),
            ),
            duration: Duration(milliseconds: 300),
          ),
          SizedBox(width: 10),
          AnimatedContainer(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: currentStep == 2 ? ColorsApp.borderAccent : ColorsApp.backgroundItemInActive.withOpacity(0.4),
            ),
            duration: Duration(milliseconds: 300),
          ),
          SizedBox(width: 10),
          AnimatedContainer(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: currentStep == 3 ? ColorsApp.borderAccent : ColorsApp.backgroundItemInActive.withOpacity(0.4),
            ),
            duration: Duration(milliseconds: 300),
          ),
        ],
      );
    else
      return SizedBox.shrink();
  }
}
