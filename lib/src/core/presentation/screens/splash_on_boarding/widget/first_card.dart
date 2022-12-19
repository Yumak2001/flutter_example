import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';

import 'on_boarding_card.dart';

class FirstCard extends StatelessWidget {
  const FirstCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnBoardingCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Добро пожаловать в ",
                  style: TextStylesApp.drukTextCyr500(30, lineHeight: 1.15),
                ),
                TextSpan(
                  text: "Фанерон!",
                  style: TextStylesApp.drukTextCyr500(30, lineHeight: 1.15, color: ColorsApp.textAccent),
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Город мечты уже здесь. Найди достопримечательности ",
                  style: TextStylesApp.pragmatica300(24, lineHeight: 1.2),
                ),
                TextSpan(
                  text: "Фанерона ",
                  style: TextStylesApp.pragmatica300(24, lineHeight: 1.2, color: ColorsApp.textAccent),
                ),
                TextSpan(
                  text: "на территории ВДНХ и рассмотри их в дополненной реальности с помощью приложения.",
                  style: TextStylesApp.pragmatica300(
                    24,
                    lineHeight: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
