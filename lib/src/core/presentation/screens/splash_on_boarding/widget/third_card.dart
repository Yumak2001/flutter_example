import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:flutter/material.dart';

import 'on_boarding_card.dart';

class ThirdCard extends StatelessWidget {
  const ThirdCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnBoardingCard(
      child: Text(
        "Посети другую часть экспозиции, интерактивное пространство, приобретя билет."
        "\n\nУзнать о пространстве можно на главной странице приложения."
        "\n\nКупленные билеты будут хранится в личном профиле.",
        style: TextStylesApp.pragmatica300(24, lineHeight: 1.2),
      ),
    );
  }
}
