import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:fluttertoast/fluttertoast.dart';

showErrorToast(String message) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: ColorsApp.inputError,
      textColor: ColorsApp.text,
      fontSize: 14.0,
    );
