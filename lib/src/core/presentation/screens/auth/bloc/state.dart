import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';
import 'package:faneron_mobile/src/core/presentation/entities/input.dart';

class AuthState {
  final ScreenStatus screenStatus;
  final AuthInputsData authInputsData;
  final bool isLoadButton;
  final bool isErrorPolitic;
  final bool successForgotPass;

  AuthState({
    this.screenStatus = ScreenStatus.loading,
    required this.authInputsData,
    this.isLoadButton = false,
    this.isErrorPolitic = false,
    this.successForgotPass = false,
  });

  AuthState copyWith({
    ScreenStatus? screenStatus,
    AuthInputsData? authInputsData,
    bool? isLoadButton,
    bool? isErrorPolitic,
    bool? successForgotPass,
  }) =>
      AuthState(
        screenStatus: screenStatus ?? this.screenStatus,
        authInputsData: authInputsData ?? this.authInputsData,
        isLoadButton: isLoadButton ?? this.isLoadButton,
        isErrorPolitic: isErrorPolitic ?? this.isErrorPolitic,
        successForgotPass: successForgotPass ?? this.successForgotPass,
      );
}
