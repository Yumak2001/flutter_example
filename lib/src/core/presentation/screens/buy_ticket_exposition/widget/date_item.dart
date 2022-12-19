import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class DateItem extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final Duration animationDuration = Duration(milliseconds: 350);

  DateItem({
    Key? key,
    required this.isSelected,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      constraints: BoxConstraints(minWidth: 70),
      height: 52,
      decoration: BoxDecoration(
          color: isSelected ? ColorsApp.backgroundItem : ColorsApp.backgroundBuyTicketExposition,
          border: Border.all(width: 0.5)),
      duration: animationDuration,
      child: Column(
        children: [
          AnimatedDefaultTextStyle(
            style: TextStylesApp.pragmatica400(
              20,
              lineHeight: 1.35,
              color: isSelected ? ColorsApp.backgroundItemLight : ColorsApp.backgroundItem,
            ),
            duration: animationDuration,
            child: Text(
              DateFormat(
                "d",
              ).format(date),
            ),
          ),
          AnimatedDefaultTextStyle(
            duration: animationDuration,
            style: TextStylesApp.pragmatica400(
              14,
              lineHeight: 1.35,
              color: isSelected ? ColorsApp.backgroundItemLight : ColorsApp.backgroundItem,
            ),
            child: Text(
              DateFormat("MMMM, E", "ru").format(date),
            ),
          ),
        ],
      ),
    );
  }
}
