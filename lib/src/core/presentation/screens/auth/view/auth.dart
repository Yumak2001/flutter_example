import 'package:faneron_mobile/src/common/controller/focus_text_field.dart';
import 'package:faneron_mobile/src/common/controller/text_field_controllers.dart';
import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';
import 'package:faneron_mobile/src/core/presentation/entities/input.dart';
import 'package:faneron_mobile/src/core/presentation/screens/auth/auth.dart';
import 'package:faneron_mobile/src/core/presentation/screens/auth/view/widget/edit_pass.dart';
import 'package:faneron_mobile/src/core/presentation/widget/appBar/second_app_bar.dart';
import 'package:faneron_mobile/src/resource/keys.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {
  static const id = '/auth';
  AuthPage({
    required Key key,
  }) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    context.read<TextFieldControllers>().clearAuthInputs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            context.read<FocusTextFieldProvider>().unFocusAuth();
            if (state.authInputsData.status! != AuthPageStatus.resetPass) {
              context.read<TextFieldControllers>().clearAuthInputs();
              return true;
            } else {
              BlocProvider.of<AuthBloc>(context)
                  .add(OnEditInputDataAuthEvent(AuthInputsData(status: AuthPageStatus.login)));
              return false;
            }
          },
          child: Scaffold(
            key: AuthPageKeys.scaffold,
            backgroundColor: ColorsApp.backgroundMainPage,
            body: Column(
              children: [
                SecondAppBarWidget(
                  keyPage: 'AuthPage',
                  title: state.authInputsData.status!.toTitle,
                  onTapBack: () {
                    context.read<FocusTextFieldProvider>().unFocusAuth();
                    if (state.authInputsData.status! != AuthPageStatus.resetPass) {
                      context.read<TextFieldControllers>().clearAuthInputs();
                      Navigator.pop(context);
                    } else {
                      BlocProvider.of<AuthBloc>(context)
                          .add(OnEditInputDataAuthEvent(AuthInputsData(status: AuthPageStatus.login)));
                    }
                  },
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(bottom: ConstantsApp.bottomViewPadding(context)),
                    color: ColorsApp.backgroundAuthPage,
                    child: IndexedStack(
                      index: state.authInputsData.status!.index,
                      children: [
                        LoginAuthBody(),
                        RegistrationAuthBody(),
                        ResetPassAuthBody(),
                        EditPassAuthBody(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
