import 'package:faneron_mobile/src/common/controller/scrolls.dart';
import 'package:faneron_mobile/src/core/presentation/screens/exposition/exposition.dart';
import 'package:faneron_mobile/src/core/presentation/widget/appBar/main_app_bar.dart';
import 'package:faneron_mobile/src/resource/keys.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpositionPage extends StatelessWidget {
  ExpositionPage({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.backgroundMainPage,
      child: Column(
        children: [
          MainAppBarWidget(
            keyPage: 'ExpositionPage',
            title: 'Экспозиция',
            titleShowScroll: true,
            extentTitleStartShowScroll: 20,
            scrollOffsetStream: context.read<ScrollProvider>().expositionPageBodyScrollOffset,
          ),
          Expanded(
            child: ExpositionPageBody(
              key: ExpositionPageKeys.body,
            ),
          ),
        ],
      ),
    );
  }
}
