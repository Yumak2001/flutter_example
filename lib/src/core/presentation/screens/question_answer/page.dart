import 'package:faneron_mobile/src/core/presentation/widget/appBar/second_app_bar.dart';
import 'package:faneron_mobile/src/resource/keys/question_answer.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';

import 'body.dart';

class QuestionAnswerPage extends StatelessWidget {
  static const id = '/question_answer';

  QuestionAnswerPage({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: ColorsApp.backgroundMainPage,
        child: Column(
          children: [
            SecondAppBarWidget(
              keyPage: this.runtimeType.toString(),
              title: 'Вопрос-Ответ',
            ),
            Expanded(
              child: QuestionAnswerPageBody(
                key: QuestionAnswerPageKeys.body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
