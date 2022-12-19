import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';

extension AuthStatusToTitle on AuthPageStatus {
  String get toTitle {
    switch (this) {
      case AuthPageStatus.login:
        return 'Войти';
      case AuthPageStatus.registration:
        return 'Регистрация';
      case AuthPageStatus.resetPass:
        return 'Восстановление пароля';
      case AuthPageStatus.editPass:
        return 'Изменение пароля';
    }
  }
}
