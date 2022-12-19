import 'package:faneron_mobile/src/core/presentation/entities/input.dart';
import 'package:flutter/services.dart';

extension InputValidationErrorText on InputValidation {
  String get toErrorText {
    switch (this) {
      case InputValidation.none:
        return 'Обязательное поле';
      case InputValidation.inValid:
        return 'Некорректное значение';
      default:
        return 'Ошибка';
    }
  }
}

extension InputTypeConfig on InputType {
  TextInputType get toKeyboard {
    switch (this) {
      case InputType.text:
        return TextInputType.text;
      case InputType.singleWord:
        return TextInputType.name;
      case InputType.number:
        return TextInputType.number;
      case InputType.email:
        return TextInputType.emailAddress;
      case InputType.pass:
        return TextInputType.visiblePassword;
    }
  }

  TextInputFormatter get toFormat {
    if (this == InputType.email) {
      return FilteringTextInputFormatter.deny(
          RegExp(r'[^a-zA-Zа-яА-Я@_\-.0-9]+'));
    }
    return FilteringTextInputFormatter.deny(this.toRegExp);
  }

  RegExp get toRegExp {
    switch (this) {
      case InputType.text:
        return RegExp(r"[^a-zA-Zа-яА-Я\ \.]+");
      case InputType.singleWord:
        return RegExp(r"[^a-zA-Zа-яА-Я]+");
      case InputType.number:
        return RegExp(r"[^0-9]+");
      case InputType.email:
        return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@'
            r'((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.'
            r'[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
      case InputType.pass:
        return RegExp(r"[^a-zA-Z0-9!@#$%&*/.;:,№]+");
    }
  }
}
