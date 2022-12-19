import 'package:faneron_mobile/src/common/controller/focus_text_field.dart';
import 'package:faneron_mobile/src/common/controller/text_field_controllers.dart';
import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';
import 'package:faneron_mobile/src/core/presentation/entities/input.dart';
import 'package:faneron_mobile/src/core/presentation/screens/auth/auth.dart';
import 'package:faneron_mobile/src/core/presentation/widget/button/button.dart';
import 'package:faneron_mobile/src/core/presentation/widget/input/input_text.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationAuthBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 20,
          ),
          sliver: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 4),
                          child: Text(
                            AuthPageStatus.registration.toTitle.toUpperCase(),
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
                                'Уже есть аккаунт?',
                                style: TextStylesApp.pragmatica300(
                                  14,
                                  color: ColorsApp.textDark,
                                  lineHeight: 1.32,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.read<FocusTextFieldProvider>().unFocusAuth();
                                  BlocProvider.of<AuthBloc>(context)
                                      .add(OnEditInputDataAuthEvent(AuthInputsData(status: AuthPageStatus.login)));
                                },
                                child: Text(
                                  'Войти'.toUpperCase(),
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
                    SizedBox(height: 16),
                    InputTextWidget(
                      focusNode: context.read<FocusTextFieldProvider>().firstNameRegistration,
                      hint: 'Имя',
                      inputType: InputType.singleWord,
                      validation: state.authInputsData.vFirstName,
                      controller: context.read<TextFieldControllers>().firstName,
                      onChange: (value) {
                        BlocProvider.of<AuthBloc>(context)
                            .add(OnEditInputDataAuthEvent(AuthInputsData(firstName: value)));
                      },
                      require: true,
                      margin: EdgeInsets.symmetric(vertical: 4),
                    ),
                    InputTextWidget(
                      focusNode: context.read<FocusTextFieldProvider>().surNameRegistration,
                      hint: 'Фамилия',
                      inputType: InputType.singleWord,
                      validation: state.authInputsData.vSurName,
                      controller: context.read<TextFieldControllers>().surName,
                      onChange: (value) {
                        BlocProvider.of<AuthBloc>(context)
                            .add(OnEditInputDataAuthEvent(AuthInputsData(surName: value)));
                      },
                      require: true,
                      margin: EdgeInsets.symmetric(vertical: 4),
                    ),
                    InputTextWidget(
                      focusNode: context.read<FocusTextFieldProvider>().cityRegistration,
                      hint: 'Город',
                      inputType: InputType.text,
                      validation: state.authInputsData.vCity,
                      controller: context.read<TextFieldControllers>().city,
                      onChange: (value) {
                        BlocProvider.of<AuthBloc>(context).add(OnEditInputDataAuthEvent(AuthInputsData(city: value)));
                      },
                      require: true,
                      margin: EdgeInsets.symmetric(vertical: 4),
                    ),
                    InputTextWidget(
                      focusNode: context.read<FocusTextFieldProvider>().ageRegistration,
                      hint: 'Возраст',
                      inputType: InputType.number,
                      controller: context.read<TextFieldControllers>().age,
                      validation: state.authInputsData.vAge,
                      error:
                          (state.authInputsData.vAge == InputValidation.error) ? 'Возраст может быть от 1 до 99' : null,
                      onChange: (value) {
                        BlocProvider.of<AuthBloc>(context).add(OnEditInputDataAuthEvent(AuthInputsData(age: value)));
                      },
                      maxLength: 3,
                      require: true,
                      margin: EdgeInsets.symmetric(vertical: 4),
                    ),
                    InputTextWidget(
                      focusNode: context.read<FocusTextFieldProvider>().authEmail,
                      hint: 'Адрес электронной почты',
                      inputType: InputType.email,
                      controller: context.read<TextFieldControllers>().email,
                      validation: state.authInputsData.vEmail,
                      error: state.authInputsData.emailError,
                      onChange: (value) {
                        BlocProvider.of<AuthBloc>(context).add(OnEditInputDataAuthEvent(AuthInputsData(email: value)));
                      },
                      require: true,
                      margin: EdgeInsets.symmetric(vertical: 4),
                    ),
                    InputTextWidget(
                      focusNode: context.read<FocusTextFieldProvider>().passRegistration,
                      hint: 'Пароль',
                      inputType: InputType.pass,
                      controller: context.read<TextFieldControllers>().passRegistration,
                      validation: state.authInputsData.vPassReg,
                      onChange: (value) {
                        BlocProvider.of<AuthBloc>(context)
                            .add(OnEditInputDataAuthEvent(AuthInputsData(passRegistration: value)));
                      },
                      require: true,
                      margin: EdgeInsets.symmetric(vertical: 4),
                    ),
                    InputTextWidget(
                      focusNode: context.read<FocusTextFieldProvider>().repeatPassRegistration,
                      hint: 'Повторите пароль',
                      inputType: InputType.pass,
                      controller: context.read<TextFieldControllers>().repeatPassRegistration,
                      equalTextFromController: context.read<TextFieldControllers>().passRegistration,
                      validation: state.authInputsData.vRepeatPass,
                      onChange: (value) {
                        BlocProvider.of<AuthBloc>(context)
                            .add(OnEditInputDataAuthEvent(AuthInputsData(repeatPass: value)));
                      },
                      require: true,
                      margin: EdgeInsets.symmetric(vertical: 4),
                    ),
                    AuthPoliticWidget(
                      state.authInputsData.politic ?? false,
                      margin: EdgeInsets.symmetric(vertical: 16),
                      isError: state.isErrorPolitic,
                    ),
                    ButtonWidget(
                      title: 'Зарегестрироваться',
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
              );
            },
          ),
        ),
      ],
    );
  }
}
