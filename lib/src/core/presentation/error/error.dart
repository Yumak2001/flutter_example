import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/core/domain/repository/errors.dart';
import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:faneron_mobile/src/core/presentation/error/cubit/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/error/cubit/state.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorView extends StatefulWidget {
  final Widget child;

  ErrorView({
    required this.child,
  });

  @override
  _ErrorViewState createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView> {
  final SmartDialogController controller = SmartDialogController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ErrorCubit, ErrorState>(
      listener: (context, state) {
        ///
        if (state.errorTypes != null) {
          Log.warning(state.errorTypes.toString());
          SmartDialog.show(
            controller: controller,
            builder: (_) {
              return Container(
                margin: EdgeInsets.only(top: ConstantsApp.appBarHeight(context)),
                width: ConstantsApp.mainSize(context).width,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppPicture.errorIcon,
                      height: 42,
                      width: 42,
                      color: state.isLight ? ColorsApp.errorColorDark : ColorsApp.errorColorLight,
                    ),
                    SizedBox(width: 8),
                    Text(
                      state.errorTypes!.toStringError,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: TextStylesApp.pragmatica400(
                        16,
                        color: state.isLight ? ColorsApp.errorColorDark : ColorsApp.errorColorLight,
                        lineHeight: 1.11,
                      ),
                    ),
                  ],
                ),
                alignment: Alignment.centerLeft,
                height: 63,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: state.isLight ? ColorsApp.errorColorDark : ColorsApp.errorColorLight, width: 2),
                  color: state.isLight ? ColorsApp.errorColorLight : ColorsApp.errorColorDark,
                ),
              );
            },
            backDismiss: true,
            alignment: Alignment.topCenter,
          );
          Future.delayed(ConstantsApp.durationErrorView).then((value) {
            SmartDialog.dismiss();
          });
        }
      },
      child: widget.child,
    );
  }
}
