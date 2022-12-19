import 'package:faneron_mobile/src/core/presentation/entities/input.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/screens/auth/auth.dart';
import 'package:faneron_mobile/src/core/presentation/widget/element/check_box.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPoliticWidget extends StatelessWidget {
  final bool value;
  final EdgeInsets margin;
  final bool isError;
  AuthPoliticWidget(
    this.value, {
    this.margin = EdgeInsets.zero,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: margin,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckBoxWidget(
            value: value,
            borderColor: isError ? ColorsApp.inputError : Colors.transparent,
            onChangeValue: (bool value) {
              BlocProvider.of<AuthBloc>(context).add(OnEditInputDataAuthEvent(AuthInputsData(politic: value)));
            },
            margin: EdgeInsets.only(right: 16, top: 3),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: 'Я соглашаюсь c ',
                style: TextStylesApp.pragmatica400(
                  18,
                  lineHeight: 1.35,
                  color: isError ? ColorsApp.inputError : ColorsApp.textBlack,
                ),
                children: [
                  TextSpan(
                    text: 'политикой\nконфиденциальности',
                    style: TextStylesApp.pragmatica400(
                      18,
                      lineHeight: 1.35,
                      color: isError ? ColorsApp.inputError : ColorsApp.textBlack,
                    ).copyWith(
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        BlocProvider.of<RouterCubit>(context).onRouteToWebView(
                          url: 'https://faneron.ru/templates/faneron22/files/f-agreement.pdf',
                          title: 'Политика конфиденциальности',
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
