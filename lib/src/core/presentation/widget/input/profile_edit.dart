import 'package:faneron_mobile/src/core/presentation/entities/input.dart';
import 'package:faneron_mobile/src/extension/input.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileEditInputWidget extends StatefulWidget {
  final String? initData;
  final FocusNode? focus;
  final TextEditingController? controller;
  final bool require;
  final bool editing;
  final String hint;
  final InputType inputType;
  final Function(String)? onChange;

  ProfileEditInputWidget({
    this.initData,
    this.focus,
    this.controller,
    this.require = false,
    this.editing = true,
    required this.hint,
    this.inputType = InputType.singleWord,
    this.onChange,
  });

  @override
  _ProfileEditInputWidgetState createState() => _ProfileEditInputWidgetState();
}

class _ProfileEditInputWidgetState extends State<ProfileEditInputWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller!.text = widget.initData ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            widget.hint,
            style: TextStylesApp.pragmatica400(
              18,
              lineHeight: 1.35,
              color: ColorsApp.text.withOpacity(0.4),
            ),
          ),
        ),
        Container(
          height: 50,
          color: ColorsApp.backgroundItemLight.withOpacity(0.1),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 16, right: 16),
          margin: EdgeInsets.only(bottom: 8),
          child: (widget.editing)
              ? TextField(
                  focusNode: widget.focus,
                  controller: widget.controller,
                  style: TextStylesApp.pragmatica400(
                    18,
                    lineHeight: 1.2,
                  ),
                  inputFormatters: [
                    widget.inputType.toFormat,
                    LengthLimitingTextInputFormatter(widget.inputType == InputType.number ? 2 : 60),
                  ],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    if (widget.onChange != null) {
                      widget.onChange!.call(value);
                    }
                  },
                )
              : Text(
                  widget.initData ?? '',
                  style: TextStylesApp.pragmatica400(
                    18,
                    lineHeight: 1.2,
                  ),
                ),
        ),
      ],
    );
  }
}
