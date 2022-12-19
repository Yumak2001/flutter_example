import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:faneron_mobile/src/resource/strings.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'cubit.dart';
import 'widget/question_answer_item.dart';
import 'widget/sized_divider.dart';

class QuestionAnswerPageBody extends StatelessWidget {
  const QuestionAnswerPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionAnswerCubit, QuestionAnswerState>(
      builder: (BuildContext context, state) {
        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Остались вопросы?".toUpperCase(),
                          style: TextStylesApp.drukTextCyr500(40, lineHeight: 1.05),
                        ),
                        SizedBox(height: 38),
                        QuestionAnswerItem(
                          title: "Где и когда проходит Фанерон?",
                          bodyText: AppStrings.questionsAnswerWhenOpen,
                          isExpanded: state.expansions[0],
                          onTap: () => context.read<QuestionAnswerCubit>().onQuestionTap(0),
                        ),
                        SizedDivider(),
                        QuestionAnswerItem(
                          title: 'Есть ли на Фанероне фудкорт?',
                          bodyText: AppStrings.questionAnswerFood,
                          isExpanded: state.expansions[1],
                          onTap: () => context.read<QuestionAnswerCubit>().onQuestionTap(1),
                        ),
                        SizedDivider(),
                        QuestionAnswerItem(
                          title: 'Можно ли купить билет на площадке?',
                          bodyText: AppStrings.questionsAnswerBuyTicket,
                          isExpanded: state.expansions[2],
                          onTap: () => context.read<QuestionAnswerCubit>().onQuestionTap(2),
                        ),
                        SizedDivider(),
                        QuestionAnswerItem(
                          title: 'Со скольки лет можно попасть на Фанерон?',
                          bodyText: AppStrings.questionsAnswerChildren,
                          isExpanded: state.expansions[3],
                          onTap: () => context.read<QuestionAnswerCubit>().onQuestionTap(3),
                        ),
                        SizedDivider(),
                        QuestionAnswerItem(
                          title: 'Есть ли билеты для льготных категорий граждан?',
                          bodyText: AppStrings.questionsAnswerBenefit,
                          isExpanded: state.expansions[4],
                          onTap: () => context.read<QuestionAnswerCubit>().onQuestionTap(4),
                        ),
                        SizedDivider(),
                        QuestionAnswerItem(
                          isExpanded: state.expansions[5],
                          onTap: () => context.read<QuestionAnswerCubit>().onQuestionTap(5),
                          title: 'Как удалить аккаунт?',
                          richText: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Чтобы удалить аккаунт свяжитесь с нами:\n",
                                    style: TextStylesApp.pragmatica400(20, lineHeight: 1.35)),
                                TextSpan(
                                  text: "faneronspace@gmail.com",
                                  style: TextStylesApp.pragmatica400(20, lineHeight: 1.35, color: ColorsApp.textAccent),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () =>
                                        launchUrlString("mailto:faneronspace@gmail.com?subject=Удаление аккаунта"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ConstantsApp.bottomViewPadding(context))
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
