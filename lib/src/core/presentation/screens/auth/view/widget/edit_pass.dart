import 'package:faneron_mobile/src/common/controller/focus_text_field.dart';
import 'package:faneron_mobile/src/common/controller/text_field_controllers.dart';
import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';
import 'package:faneron_mobile/src/core/presentation/entities/input.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/screens/auth/auth.dart';
import 'package:faneron_mobile/src/core/presentation/widget/button/button.dart';
import 'package:faneron_mobile/src/core/presentation/widget/input/input_text.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPassAuthBody extends StatelessWidget {
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 24, right: 100),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  AuthPageStatus.editPass.toTitle.toUpperCase(),
                                  textAlign: TextAlign.left,
                                  style: TextStylesApp.bebus700(
                                    48,
                                    color: ColorsApp.textBlack,
                                  ),
                                ),
                              ),
                              InputTextWidget(
                                focusNode: context.read<FocusTextFieldProvider>().editPass,
                                hint: 'Текущий пароль',
                                validation: state.authInputsData.vEditPass,
                                error: state.authInputsData.editPassError,
                                controller: context.read<TextFieldControllers>().editPass,
                                onChange: (value) {
                                  BlocProvider.of<AuthBloc>(context)
                                      .add(OnEditInputDataAuthEvent(AuthInputsData(editPass: value)));
                                },
                                require: true,
                                inputType: InputType.pass,
                                margin: EdgeInsets.symmetric(vertical: 4),
                              ),
                              InputTextWidget(
                                focusNode: context.read<FocusTextFieldProvider>().editPassNew,
                                hint: 'Новый пароль',
                                validation: state.authInputsData.vEditPassNew,
                                controller: context.read<TextFieldControllers>().editPassNew,
                                onChange: (value) {
                                  BlocProvider.of<AuthBloc>(context)
                                      .add(OnEditInputDataAuthEvent(AuthInputsData(editPassNew: value)));
                                },
                                require: true,
                                inputType: InputType.pass,
                                margin: EdgeInsets.symmetric(vertical: 4),
                              ),
                              InputTextWidget(
                                focusNode: context.read<FocusTextFieldProvider>().editPassNewRepeat,
                                hint: 'Повторите новый пароль',
                                validation: state.authInputsData.vEditPassNewRepeat,
                                controller: context.read<TextFieldControllers>().editPassNewRepeat,
                                onChange: (value) {
                                  BlocProvider.of<AuthBloc>(context)
                                      .add(OnEditInputDataAuthEvent(AuthInputsData(editPassNewRepeat: value)));
                                },
                                equalTextFromController: context.read<TextFieldControllers>().editPassNew,
                                require: true,
                                inputType: InputType.pass,
                                margin: EdgeInsets.symmetric(vertical: 4),
                              ),
                              SizedBox(height: 24),
                              if (state.successForgotPass)
                                Container(
                                  padding: EdgeInsets.only(bottom: 24),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Пароль успешно изменен.',
                                    textAlign: TextAlign.left,
                                    style: TextStylesApp.pragmatica400(
                                      18,
                                      color: ColorsApp.textBlack,
                                      lineHeight: 1.35,
                                    ),
                                  ),
                                ),
                              ButtonWidget(
                                title: state.successForgotPass ? 'Назад' : 'Сохранить',
                                onTap: () {
                                  context.read<FocusTextFieldProvider>().unFocusAuth();
                                  if (state.successForgotPass) {
                                    BlocProvider.of<RouterCubit>(context).onPop();
                                  } else {
                                    BlocProvider.of<AuthBloc>(context).add(OnTapSendDataAuthEvent());
                                  }
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
