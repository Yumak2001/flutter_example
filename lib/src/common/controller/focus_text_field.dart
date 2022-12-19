import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class FocusTextFieldProvider extends ChangeNotifier {
  final FocusNode laboratorySearch = FocusNode();
  final FocusNode authEmail = FocusNode();
  final FocusNode authPass = FocusNode();
  final FocusNode resetPassEmail = FocusNode();
  final FocusNode firstNameRegistration = FocusNode();
  final FocusNode surNameRegistration = FocusNode();
  final FocusNode cityRegistration = FocusNode();
  final FocusNode ageRegistration = FocusNode();
  final FocusNode emailRegistration = FocusNode();
  final FocusNode passRegistration = FocusNode();
  final FocusNode repeatPassRegistration = FocusNode();
  final FocusNode editPass = FocusNode();
  final FocusNode editPassNew = FocusNode();
  final FocusNode editPassNewRepeat = FocusNode();
  final FocusNode profileSettingFirstName = FocusNode();
  final FocusNode profileSettingSurName = FocusNode();
  final FocusNode profileSettingCity = FocusNode();
  final FocusNode profileSettingAge = FocusNode();

  void unFocusAll() {
    laboratorySearch.unfocus();
    unFocusAuth();
    unFocusProfileSetting();
  }

  void unFocusAuth() {
    authEmail.unfocus();
    authPass.unfocus();
    resetPassEmail.unfocus();
    firstNameRegistration.unfocus();
    surNameRegistration.unfocus();
    cityRegistration.unfocus();
    ageRegistration.unfocus();
    emailRegistration.unfocus();
    passRegistration.unfocus();
    repeatPassRegistration.unfocus();
    editPass.unfocus();
    editPassNew.unfocus();
    editPassNewRepeat.unfocus();
  }

  void unFocusProfileSetting() {
    profileSettingFirstName.unfocus();
    profileSettingSurName.unfocus();
    profileSettingCity.unfocus();
    profileSettingAge.unfocus();
  }
}
