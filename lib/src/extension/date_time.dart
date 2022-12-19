import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class DateTimeToString {
  static String eventStartFinishTime(DateTime start, DateTime finish) {
    return '${DateFormat('dd MMMM, HH:mm', 'ru-RU').format(start)} - ${DateFormat('HH:mm').format(finish)}';
  }

  static String eventDateToString(DateTime start) {
    return DateFormat('d MMMM, EEEE', 'ru-RU').format(start);
  }

  static String eventTimeToString(DateTime start, DateTime finish) {
    return '${DateFormat('HH:mm').format(start)} - ${DateFormat('HH:mm').format(finish)}';
  }
}
