import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';

class ArTemp extends StatelessWidget {
  ArTemp() : super();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: ColorsApp.backgroundMainPage,
        body: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Positioned(
              top: -(screenHeight / 30),
              height: screenHeight / 1.5,
              child: Image.asset(
                AppPicture.upperBlurLight,
              ),
            ),
            Positioned(
              top: screenHeight / 4,
              left: 19,
              width: 226,
              child: Text("Скоро тут будет магия".toUpperCase(),
                  style: TextStylesApp.drukTextCyr500(
                    32,
                    lineHeight: 1.30,
                  )),
            ),
            Positioned(
              bottom: -(screenHeight) / 12,
              height: screenHeight / 2.3,
              child: Image.asset(AppPicture.elio),
            ),
          ],
        ));
  }
}
