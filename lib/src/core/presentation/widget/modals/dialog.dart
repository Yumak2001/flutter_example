import 'package:flutter/material.dart';

Future<T?> showDefaultDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
}) =>
    showDialog(
      context: context,
      builder: builder,
    );
