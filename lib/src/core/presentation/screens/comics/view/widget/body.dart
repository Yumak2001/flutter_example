import 'dart:io';

import 'package:faneron_mobile/src/core/presentation/entities/comics_item.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ComicsPageBody extends StatelessWidget {
  final List<ComicsItemData> items = [
    ComicsItemData(image: AppPicture.comics7, title: 'Спейс', url: 'https://faneron.ru/comics/7'),
    ComicsItemData(image: AppPicture.comics1, title: 'Создание', url: 'https://faneron.ru/comics/1'),
    ComicsItemData(image: AppPicture.comics2, title: 'Креарт', url: 'https://faneron.ru/comics/2'),
    ComicsItemData(image: AppPicture.comics3, title: 'Материя стиля', url: 'https://faneron.ru/comics/3'),
    ComicsItemData(image: AppPicture.comics4, title: 'Транспортация', url: 'https://faneron.ru/comics/4'),
    ComicsItemData(image: AppPicture.comics5, title: 'Е-да', url: 'https://faneron.ru/comics/5'),
    ComicsItemData(image: AppPicture.comics6, title: 'спорт будущего', url: 'https://faneron.ru/comics/6'),
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 60),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: RichText(
                    text: TextSpan(
                      text: 'Вселенная миров '.toUpperCase(),
                      style: TextStylesApp.drukCyr500(70, lineHeight: 0.85),
                      children: [
                        TextSpan(
                          text: 'Фанерон'.toUpperCase(),
                          style: TextStylesApp.drukCyr500(
                            70,
                            lineHeight: 0.85,
                            color: ColorsApp.textAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ...items.map((e) => itemComics(e)).toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget itemComics(ComicsItemData item) {
    return GestureDetector(
      onTap: () {
        launchUrlString(
          item.url,
          mode: Platform.isAndroid ? LaunchMode.externalApplication : LaunchMode.inAppWebView,
        );
      },
      child: Container(
        height: 300,
        margin: EdgeInsets.symmetric(vertical: 20),
        color: Colors.transparent,
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                item.image,
                width: 280,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 8),
              child: Text(
                item.title.toUpperCase(),
                style: TextStylesApp.drukTextCyr500(
                  55,
                  lineHeight: 1.05,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
