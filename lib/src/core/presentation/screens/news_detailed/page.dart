import 'package:faneron_mobile/src/core/presentation/widget/appBar/second_app_bar.dart';
import 'package:faneron_mobile/src/resource/keys/news_detailed.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';

import 'body.dart';

class NewsDetailedPage extends StatelessWidget {
  static const id = '/detailed';

  NewsDetailedPage({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: ColorsApp.backgroundMainPage,
        child: Column(
          children: [
            SecondAppBarWidget(
              keyPage: this.runtimeType.toString(),
              title: 'Новости',
            ),
            Expanded(
              child: NewsDetailedPageBody(
                key: NewsDetailedPageKeys.body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
