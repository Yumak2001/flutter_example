import 'package:faneron_mobile/src/common/controller/focus_text_field.dart';
import 'package:faneron_mobile/src/common/controller/text_field_controllers.dart';
import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';
import 'package:faneron_mobile/src/core/presentation/entities/input.dart';
import 'package:faneron_mobile/src/core/presentation/screens/auth/auth.dart';
import 'package:faneron_mobile/src/core/presentation/widget/button/button.dart';
import 'package:faneron_mobile/src/core/presentation/widget/input/input_text.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginAuthBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 4),
                                    child: Text(
                                      AuthPageStatus.login.toTitle.toUpperCase(),
                                      style: TextStylesApp.bebus700(
                                        48,
                                        color: ColorsApp.textBlack,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Еще нет аккаунта?',
                                          style: TextStylesApp.pragmatica300(14,
                                              color: ColorsApp.textDark, lineHeight: 1.32),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            context.read<FocusTextFieldProvider>().unFocusAuth();
                                            BlocProvider.of<AuthBloc>(context).add(OnEditInputDataAuthEvent(
                                                AuthInputsData(status: AuthPageStatus.registration)));
                                          },
                                          child: Text(
                                            'Зарегестрироваться'.toUpperCase(),
                                            style: TextStylesApp.drukTextCyr400(
                                              20,
                                              color: ColorsApp.textAccent,
                                              lineHeight: 1.5,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              InputTextWidget(
                                focusNode: context.read<FocusTextFieldProvider>().authEmail,
                                hint: 'Адрес электронной почты',
                                inputType: InputType.email,
                                controller: context.read<TextFieldControllers>().email,
                                error: state.authInputsData.emailError,
                                validation: state.authInputsData.vEmail,
                                onChange: (value) {
                                  BlocProvider.of<AuthBloc>(context)
                                      .add(OnEditInputDataAuthEvent(AuthInputsData(email: value)));
                                },
                                require: true,
                                margin: EdgeInsets.symmetric(vertical: 4),
                              ),
                              InputTextWidget(
                                focusNode: context.read<FocusTextFieldProvider>().authPass,
                                hint: 'Пароль',
                                validation: state.authInputsData.vPassAuth,
                                error: state.authInputsData.passAuthError,
                                controller: context.read<TextFieldControllers>().passAuth,
                                onChange: (value) {
                                  BlocProvider.of<AuthBloc>(context)
                                      .add(OnEditInputDataAuthEvent(AuthInputsData(passAuth: value)));
                                },
                                require: true,
                                inputType: InputType.pass,
                                margin: EdgeInsets.symmetric(vertical: 4),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 11),
                                alignment: Alignment.centerLeft,
                                child: GestureDetector(
                                  onTap: () {
                                    context.read<FocusTextFieldProvider>().unFocusAuth();
                                    BlocProvider.of<AuthBloc>(context).add(
                                        OnEditInputDataAuthEvent(AuthInputsData(status: AuthPageStatus.resetPass)));
                                  },
                                  child: Text(
                                    'Забыли пароль?',
                                    style: TextStylesApp.drukTextCyr400(
                                      18,
                                      color: ColorsApp.textAccent,
                                      lineHeight: 1.35,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 24),
                              ButtonWidget(
                                title: 'Войти',
                                onTap: () {
                                  context.read<FocusTextFieldProvider>().unFocusAuth();
                                  BlocProvider.of<AuthBloc>(context).add(OnTapSendDataAuthEvent());
                                },
                                loading: state.isLoadButton,
                                height: 54,
                                light: true,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Image.asset(
                            AppPicture.authBottomLogo,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
