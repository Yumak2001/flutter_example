import 'package:faneron_mobile/src/core/presentation/screens/splash_on_boarding/widget/on_boarding_card.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';

class SecondCard extends StatelessWidget {
  const SecondCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnBoardingCard(
      isWithShadow: false,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Объекты приведут к экспозиции в павильоне космоса. \n\nТам можно глубже погрузиться во вселенную ",
              style: TextStylesApp.pragmatica300(24, lineHeight: 1.2),
            ),
            TextSpan(
              text: "Фанерона ",
              style: TextStylesApp.pragmatica300(24, lineHeight: 1.2, color: ColorsApp.textAccent),
            ),
            TextSpan(
              text: "и научиться самому создавать комиксы!\n\nЗарегистрируйся в разделе лаборатория на бесплатный "
                  "мастер-класс, лекцию или воркшоп",
              style: TextStylesApp.pragmatica300(
                24,
                lineHeight: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
