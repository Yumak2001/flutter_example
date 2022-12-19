import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class TextFieldControllers extends ChangeNotifier {
  final TextEditingController email = TextEditingController();
  final TextEditingController passAuth = TextEditingController();
  final TextEditingController passRegistration = TextEditingController();
  final TextEditingController repeatPassRegistration = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController surName = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController editPass = TextEditingController();
  final TextEditingController editPassNew = TextEditingController();
  final TextEditingController editPassNewRepeat = TextEditingController();
  final TextEditingController laboratorySearch = TextEditingController();
  final TextEditingController profileSettingFirstName = TextEditingController();
  final TextEditingController profileSettingSurName = TextEditingController();
  final TextEditingController profileSettingCity = TextEditingController();
  final TextEditingController profileSettingAge = TextEditingController();

  void clearAuthInputs() {
    email.clear();
    passAuth.clear();
    passRegistration.clear();
    repeatPassRegistration.clear();
    firstName.clear();
    surName.clear();
    city.clear();
    age.clear();
    editPass.clear();
    editPassNew.clear();
    editPassNewRepeat.clear();
  }

  void clearSearchLaboratory() {
    laboratorySearch.clear();
  }
}
