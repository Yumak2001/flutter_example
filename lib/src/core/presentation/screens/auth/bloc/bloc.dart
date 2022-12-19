import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/core/domain/repository/auth.dart';
import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';
import 'package:faneron_mobile/src/core/presentation/entities/input.dart';
import 'package:faneron_mobile/src/core/presentation/screens/auth/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

typedef AuthEmit = Emitter<AuthState>;

@Injectable()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late bool editPass;

  late Function callback;

  final AuthRepository _authRepository;

  AuthBloc(
    @factoryParam this.editPass,
    @factoryParam this.callback,
    this._authRepository,
  ) : super(AuthState(
          authInputsData: AuthInputsData(
            status: (editPass) ? AuthPageStatus.editPass : AuthPageStatus.login,
            politic: false,
          ),
        )) {
    on<OnLoadAuthEvent>(_onLoad);
    on<OnTapSendDataAuthEvent>(_onTapSendData);
    on<OnEditInputDataAuthEvent>(_onEditInputData);
    add(OnLoadAuthEvent());
  }

  _onLoad(OnLoadAuthEvent event, AuthEmit emit) async {
    emit(state.copyWith(
      screenStatus: ScreenStatus.view,
    ));
  }

  _onTapSendData(OnTapSendDataAuthEvent event, AuthEmit emit) async {
    emit(state.copyWith(
      isLoadButton: true,
      authInputsData: state.authInputsData.copyWith(
        emailError: null,
        passAuthError: null,
        passRegistrationError: null,
        editPassError: null,
      ),
    ));
    //TODO: send data login or registration
    Log.info('On Tap Send Data ${state.authInputsData.status?.name} | ${state.authInputsData.notNullOfStatus}');
    if (state.authInputsData.notNullOfStatus) {
      await Future.delayed(Duration(seconds: 2));
      switch (state.authInputsData.status) {
        case AuthPageStatus.login:
          var result = await _authRepository.login(
            email: state.authInputsData.email!,
            password: state.authInputsData.passAuth!,
          );
          Log.info(result.toString());
          emit(state.copyWith(
            isLoadButton: false,
            authInputsData: state.authInputsData.copyWith(
              emailError: result ? null : 'Неверный email или пароль',
            ),
          ));
          if (result) {
            callback.call();
          }
          break;
        case AuthPageStatus.registration:
          var result = await _authRepository.register(
            firstName: state.authInputsData.firstName!,
            surName: state.authInputsData.surName!,
            email: state.authInputsData.email!,
            password: state.authInputsData.passRegistration!,
            passwordConfirm: state.authInputsData.repeatPass!,
            city: state.authInputsData.city!,
            age: int.parse(state.authInputsData.age!),
          );
          emit(state.copyWith(
            isLoadButton: false,
            authInputsData: state.authInputsData.copyWith(
              emailError: result ? null : 'Пользователь с таким email уже существует',
            ),
          ));
          if (result) {
            callback.call();
          }
          break;
        case AuthPageStatus.resetPass:
          var result = await _authRepository.resetPass(state.authInputsData.email!);
          emit(state.copyWith(
            isLoadButton: false,
            authInputsData: state.authInputsData.copyWith(
              emailError: result ? null : 'Неверный адрес электронной почты',
            ),
            successForgotPass: result,
          ));
          break;
        case AuthPageStatus.editPass:
          var result = await _authRepository.editPass(
            editPass: state.authInputsData.editPass!,
            editPassNew: state.authInputsData.editPassNew!,
            editPassNewRepeat: state.authInputsData.editPassNewRepeat!,
          );
          emit(state.copyWith(
            isLoadButton: false,
            authInputsData: state.authInputsData.copyWith(
              editPassError: result ? null : 'Не верный пароль',
            ),
            successForgotPass: result,
          ));
          break;
        default:
          break;
      }
    } else {
      switch (state.authInputsData.status) {
        case AuthPageStatus.login:
          emit(state.copyWith(
              authInputsData: state.authInputsData.copyWith(
            email: state.authInputsData.email ?? '',
            passAuth: state.authInputsData.passAuth ?? '',
          )));
          break;
        case AuthPageStatus.registration:
          emit(state.copyWith(
              authInputsData: state.authInputsData.copyWith(
            email: state.authInputsData.email ?? '',
            firstName: state.authInputsData.firstName ?? '',
            surName: state.authInputsData.surName ?? '',
            city: state.authInputsData.city ?? '',
            age: state.authInputsData.age ?? '',
            passRegistration: state.authInputsData.passRegistration ?? '',
            repeatPass: state.authInputsData.repeatPass ?? '',
          )));
          break;
        case AuthPageStatus.editPass:
          emit(state.copyWith(
              authInputsData: state.authInputsData.copyWith(
            editPass: state.authInputsData.editPass ?? '',
            editPassNew: state.authInputsData.editPassNew ?? '',
            editPassNewRepeat: state.authInputsData.editPassNewRepeat ?? '',
          )));
          break;
        default:
          break;
      }
      if (!(state.authInputsData.politic ?? false)) {
        emit(state.copyWith(isErrorPolitic: true));
      }
      emit(state.copyWith(isLoadButton: false));
    }
  }

  _onEditInputData(OnEditInputDataAuthEvent event, AuthEmit emit) async {
    emit(state.copyWith(
      authInputsData: state.authInputsData.replace(event.inputs),
      isErrorPolitic: event.inputs.politic != null || event.inputs.status != null ? false : null,
    ));
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
