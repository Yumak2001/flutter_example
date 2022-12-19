import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';

class SizedDivider extends StatelessWidget {
  const SizedDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Divider(height: 1, thickness: 1, color: ColorsApp.borderLight),
        SizedBox(height: 24),
      ],
    );
  }
}
