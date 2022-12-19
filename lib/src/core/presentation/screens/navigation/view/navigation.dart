import 'package:faneron_mobile/src/common/controller/scrolls.dart';
import 'package:faneron_mobile/src/core/presentation/screens/navigation/navigation.dart';
import 'package:faneron_mobile/src/core/presentation/widget/appBar/second_app_bar.dart';
import 'package:faneron_mobile/src/resource/keys.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationPage extends StatefulWidget {
  static const id = '/navigation';
  NavigationPage({required Key key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: NavigationPageKeys.scaffold,
      backgroundColor: ColorsApp.backgroundMainPage,
      body: Column(
        children: [
          SecondAppBarWidget(
            keyPage: 'NavigationPage',
            title: 'Как добраться',
            titleShowScroll: true,
            extentTitleStartShowScroll: 20,
            scrollOffsetStream: context.read<ScrollProvider>().navigationPageBodyScrollOffset,
          ),
          Expanded(
            child: NavigationPageBody(
              key: NavigationPageKeys.body,
            ),
          ),
        ],
      ),
    );
  }
}
