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
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassAuthBody extends StatelessWidget {
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
                              Container(
                                padding: EdgeInsets.only(top: 4),
                                child: Text(
                                  AuthPageStatus.resetPass.toTitle.toUpperCase(),
                                  style: TextStylesApp.bebus700(
                                    48,
                                    color: ColorsApp.textBlack,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 29),
                                child: Text(
                                  'Для восстановления пароля, введите электронную почту, указанную при регистрации.',
                                  style: TextStylesApp.pragmatica400(
                                    18,
                                    color: ColorsApp.textBlack,
                                    lineHeight: 1.35,
                                  ),
                                ),
                              ),
                              InputTextWidget(
                                focusNode: context.read<FocusTextFieldProvider>().authEmail,
                                hint: 'Адрес электронной почты',
                                inputType: InputType.email,
                                controller: context.read<TextFieldControllers>().email,
                                validation: state.authInputsData.vEmail,
                                error: state.authInputsData.emailError,
                                onChange: (value) {
                                  BlocProvider.of<AuthBloc>(context)
                                      .add(OnEditInputDataAuthEvent(AuthInputsData(email: value)));
                                },
                                require: true,
                              ),
                              SizedBox(height: 35),
                              if (state.successForgotPass)
                                Container(
                                  padding: EdgeInsets.only(bottom: 35),
                                  child: Text(
                                    'На указаный email отправленна ссылка сброса пароля.',
                                    style: TextStylesApp.pragmatica400(
                                      18,
                                      color: ColorsApp.textBlack,
                                      lineHeight: 1.35,
                                    ),
                                  ),
                                ),
                              ButtonWidget(
                                title: state.successForgotPass ? 'Назад' : 'Восстановить',
                                onTap: () {
                                  context.read<FocusTextFieldProvider>().unFocusAuth();
                                  if (state.successForgotPass) {
                                    BlocProvider.of<AuthBloc>(context)
                                        .add(OnEditInputDataAuthEvent(AuthInputsData(status: AuthPageStatus.login)));
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
