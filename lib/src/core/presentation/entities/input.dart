import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';
import 'package:faneron_mobile/src/extension/input.dart';

enum InputType {
  text,
  singleWord,
  number,
  email,
  pass,
}

enum InputValidation {
  valid,
  none,
  inValid,
  error,
}

class AuthInputsData {
  final bool? politic;
  final AuthPageStatus? status;
  final String? email;
  final String? passAuth;
  final String? passRegistration;
  final String? firstName;
  final String? surName;
  final String? city;
  final String? age;
  final String? repeatPass;
  final String? editPass;
  final String? editPassNew;
  final String? editPassNewRepeat;

  final String? emailError;
  final String? passAuthError;
  final String? passRegistrationError;
  final String? editPassError;

  InputValidation get vEmail {
    if (this.emailError != null) {
      return InputValidation.error;
    }
    if (this.email == null) {
      return InputValidation.valid;
    }
    if (this.email == '') {
      return InputValidation.none;
    } else {
      var regExp = InputType.email.toRegExp;
      if (regExp.hasMatch(this.email!)) {
        return InputValidation.valid;
      } else {
        return InputValidation.inValid;
      }
    }
  }

  InputValidation get vPassAuth {
    if (passAuthError != null) {
      return InputValidation.inValid;
    }
    if (this.passAuth == null) {
      return InputValidation.valid;
    }
    if (this.passAuth == '') {
      return InputValidation.none;
    } else {
      if (this.passAuth!.length > 7) {
        return InputValidation.valid;
      } else {
        return InputValidation.inValid;
      }
    }
  }

  InputValidation get vAge {
    if (this.age == null) {
      return InputValidation.valid;
    }
    if (this.age == '') {
      return InputValidation.none;
    } else {
      var data = int.tryParse(this.age!);
      if (data != null) {
        if (data > 0 && data < 100) {
          return InputValidation.valid;
        } else
          return InputValidation.error;
      } else {
        return InputValidation.inValid;
      }
    }
  }

  InputValidation get vFirstName {
    if (this.firstName == null) {
      return InputValidation.valid;
    }
    if (this.firstName == '') {
      return InputValidation.none;
    } else {
      return InputValidation.valid;
    }
  }

  InputValidation get vSurName {
    if (this.surName == null) {
      return InputValidation.valid;
    }
    if (this.surName == '') {
      return InputValidation.none;
    } else {
      return InputValidation.valid;
    }
  }

  InputValidation get vCity {
    if (this.city == null) {
      return InputValidation.valid;
    }
    if (this.city == '') {
      return InputValidation.none;
    } else {
      return InputValidation.valid;
    }
  }

  InputValidation get vPassReg {
    if (passRegistrationError != null) {
      return InputValidation.inValid;
    }
    if (this.passRegistration == null) {
      return InputValidation.valid;
    }
    if (this.passRegistration == '') {
      return InputValidation.none;
    } else {
      if (this.passRegistration!.length > 7) {
        return InputValidation.valid;
      } else {
        return InputValidation.inValid;
      }
    }
  }

  InputValidation get vEditPass {
    if (editPassError != null) {
      return InputValidation.inValid;
    }
    if (this.editPass == null) {
      return InputValidation.valid;
    }
    if (this.editPass == '') {
      return InputValidation.none;
    } else {
      if (this.editPass!.length > 7) {
        return InputValidation.valid;
      } else {
        return InputValidation.inValid;
      }
    }
  }

  InputValidation get vEditPassNew {
    if (this.editPassNew == null) {
      return InputValidation.valid;
    }
    if (this.editPassNew == '') {
      return InputValidation.none;
    } else {
      if (this.editPassNew!.length > 7) {
        return InputValidation.valid;
      } else {
        return InputValidation.inValid;
      }
    }
  }

  InputValidation get vRepeatPass {
    if (this.repeatPass == '') {
      return InputValidation.none;
    } else {
      if (this.repeatPass == this.passRegistration) {
        return InputValidation.valid;
      } else {
        return InputValidation.inValid;
      }
    }
  }

  InputValidation get vEditPassNewRepeat {
    if (this.editPassNewRepeat == '') {
      return InputValidation.none;
    } else {
      if (this.editPassNewRepeat == this.editPassNew) {
        return InputValidation.valid;
      } else {
        return InputValidation.inValid;
      }
    }
  }

  const AuthInputsData({
    this.politic,
    this.status,
    this.email,
    this.passAuth,
    this.passRegistration,
    this.firstName,
    this.surName,
    this.city,
    this.age,
    this.repeatPass,
    this.emailError,
    this.passAuthError,
    this.passRegistrationError,
    this.editPass,
    this.editPassNew,
    this.editPassNewRepeat,
    this.editPassError,
  });

  AuthInputsData replace(AuthInputsData newData) => AuthInputsData(
        politic: newData.politic ?? this.politic,
        status: newData.status ?? this.status,
        email: newData.email ?? this.email,
        passAuth: newData.passAuth ?? this.passAuth,
        passRegistration: newData.passRegistration ?? this.passRegistration,
        firstName: newData.firstName ?? this.firstName,
        surName: newData.surName ?? this.surName,
        city: newData.city ?? this.city,
        age: newData.age ?? this.age,
        repeatPass: newData.repeatPass ?? this.repeatPass,
        editPass: newData.editPass ?? this.editPass,
        editPassNew: newData.editPassNew ?? this.editPassNew,
        editPassNewRepeat: newData.editPassNewRepeat ?? this.editPassNewRepeat,
        emailError: null,
        passAuthError: null,
        passRegistrationError: null,
        editPassError: null,
      );

  AuthInputsData copyWith({
    bool? politic,
    AuthPageStatus? status,
    String? email,
    String? passAuth,
    String? passRegistration,
    String? firstName,
    String? surName,
    String? city,
    String? age,
    String? repeatPass,
    String? emailError,
    String? passAuthError,
    String? passRegistrationError,
    String? editPass,
    String? editPassNew,
    String? editPassNewRepeat,
    String? editPassError,
  }) =>
      AuthInputsData(
        politic: politic ?? this.politic,
        status: status ?? this.status,
        email: email ?? this.email,
        passAuth: passAuth ?? this.passAuth,
        passRegistration: passRegistration ?? this.passRegistration,
        firstName: firstName ?? this.firstName,
        surName: surName ?? this.surName,
        city: city ?? this.city,
        age: age ?? this.age,
        editPass: editPass ?? this.editPass,
        editPassNew: editPassNew ?? this.editPassNew,
        editPassNewRepeat: editPassNewRepeat ?? this.editPassNewRepeat,
        repeatPass: repeatPass ?? this.repeatPass,
        emailError: emailError,
        passAuthError: passAuthError,
        passRegistrationError: passRegistrationError,
        editPassError: editPassError,
      );

  bool get notNullOfStatus {
    if (this.status != null) {
      switch (this.status!) {
        case AuthPageStatus.login:
          return (this.email != null &&
              this.passAuth != null &&
              vEmail == InputValidation.valid &&
              vPassAuth == InputValidation.valid);
        case AuthPageStatus.registration:
          return (this.politic != null &&
              this.politic! &&
              this.firstName != null &&
              this.surName != null &&
              this.city != null &&
              this.age != null &&
              this.repeatPass != null &&
              this.email != null &&
              this.passRegistration != null &&
              vEmail == InputValidation.valid &&
              vPassReg == InputValidation.valid &&
              vRepeatPass == InputValidation.valid &&
              vAge == InputValidation.valid);
        case AuthPageStatus.resetPass:
          return (this.email != null);
        case AuthPageStatus.editPass:
          return (this.editPass != null &&
              vEditPass == InputValidation.valid &&
              this.editPassNew != null &&
              vEditPassNew == InputValidation.valid &&
              this.editPassNewRepeat != null &&
              vEditPassNewRepeat == InputValidation.valid);
      }
    } else {
      return false;
    }
  }
}
