import 'package:faneron_mobile/src/common/controller/scrolls.dart';
import 'package:faneron_mobile/src/core/presentation/widget/appBar/second_app_bar.dart';
import 'package:faneron_mobile/src/resource/keys/news_list.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'body.dart';

class NewsListPage extends StatelessWidget {
  static const id = '/news_list';

  NewsListPage({
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
              titleShowScroll: true,
              extentTitleStartShowScroll: 20,
              scrollOffsetStream: context.read<ScrollProvider>().newsListPageBodyScrollOffset,
            ),
            Expanded(
              child: NewsListPageBody(
                key: NewsListPageKeys.body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
