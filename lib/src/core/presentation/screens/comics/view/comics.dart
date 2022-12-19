import 'package:faneron_mobile/src/core/presentation/screens/comics/comics.dart';
import 'package:faneron_mobile/src/core/presentation/widget/appBar/second_app_bar.dart';
import 'package:faneron_mobile/src/resource/keys.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';

class ComicsPage extends StatefulWidget {
  static const id = '/comics';
  ComicsPage({required Key key}) : super(key: key);

  @override
  _ComicsPageState createState() => _ComicsPageState();
}

class _ComicsPageState extends State<ComicsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundMainPage,
      body: Column(
        children: [
          SecondAppBarWidget(
            keyPage: 'ComicsPage',
            title: 'Комиксы фанерона',
          ),
          Expanded(
            child: ComicsPageBody(),
          ),
        ],
      ),
    );
  }
}
