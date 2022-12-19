import 'package:faneron_mobile/src/core/presentation/screens/buy_ticket_exposition/cubit.dart';
import 'package:faneron_mobile/src/resource/icons.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'gold_ticket_button.dart';

class BuyTicketCard extends StatelessWidget {
  final DateTime selectedDate;

  const BuyTicketCard({
    Key? key,
    required this.selectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 287,
      padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 23),
      decoration: BoxDecoration(border: Border.all()),
      child: Column(
        children: [
          Text(
            "ВХОДНОЙ БИЛЕТ НА экспозициЮ фанерона".toUpperCase(),
            style: TextStylesApp.drukTextCyr500(
              26,
              color: ColorsApp.textBlack,
              lineHeight: 1.1,
            ),
          ),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(AppIcons.calendar, size: 20),
              SizedBox(width: 10),
              Text(
                DateFormat("d MMMM, EEEE", "ru").format(selectedDate),
                style: TextStylesApp.pragmatica400(
                  20,
                  lineHeight: 1.35,
                  color: ColorsApp.textBlack,
                ),
              )
            ],
          ),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AppPicture.locationIcon, width: 19),
              SizedBox(width: 10),
              Text(
                "ВДНХ, павильон «Космос»",
                style: TextStylesApp.pragmatica400(
                  20,
                  lineHeight: 1.35,
                  color: ColorsApp.textBlack,
                ),
              )
            ],
          ),
          SizedBox(height: 30),
          GoldTicketButton(onTap: () => context.read<BuyTicketExpositionCubit>().onBuyButtonPressed())
        ],
      ),
    );
  }
}
