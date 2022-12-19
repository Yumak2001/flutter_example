import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Новости'.toUpperCase(),
          style: TextStylesApp.drukCyr500(
            84,
            lineHeight: 1,
          ),
        ),
        SizedBox(width: 25),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Image.asset(AppPicture.transport, height: 76, fit: BoxFit.fitHeight),
        )
      ],
    );
  }
}
