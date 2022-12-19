import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:faneron_mobile/src/core/presentation/entities/input.dart';
import 'package:faneron_mobile/src/extension/input.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rxdart/rxdart.dart';

class InputTextWidget extends StatefulWidget {
  final InputType inputType;
  final InputValidation validation;
  final String hint;
  final FocusNode focusNode;
  final TextEditingController controller;
  final TextEditingController? equalTextFromController;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  final EdgeInsets margin;
  final String? error;
  final int maxLength;
  final bool require;

  InputTextWidget({
    required this.focusNode,
    this.inputType = InputType.text,
    this.validation = InputValidation.valid,
    required this.controller,
    this.equalTextFromController,
    this.hint = '',
    this.onChange,
    this.onSubmit,
    this.margin = EdgeInsets.zero,
    this.error,
    this.require = false,
    this.maxLength = 60,
  });

  @override
  _InputTextWidgetState createState() => _InputTextWidgetState(focusNode: focusNode);
}

class _InputTextWidgetState extends State<InputTextWidget> with TickerProviderStateMixin {
  final FocusNode focusNode;

  _InputTextWidgetState({required this.focusNode});

  final BehaviorSubject<bool> isFocus = BehaviorSubject<bool>.seeded(false);

  late String? error;
  late bool showText;
  late InputValidation validation;

  @override
  void initState() {
    validation = widget.validation;
    showText = widget.inputType != InputType.pass;
    error = widget.error;
    super.initState();
    focusNode.addListener(listenerFocus);
  }

  @override
  void didUpdateWidget(covariant InputTextWidget oldWidget) {
    if (widget.controller.text.length > 0) validateInput();
    if (widget.error != null) {
      error = widget.error;
    }
    if (validation == InputValidation.valid) {
      validation = widget.validation;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller.text != '') {
      isFocus.add(true);
    }
    return Container(
      margin: widget.margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 56,
            decoration: BoxDecoration(
              border: (validation == InputValidation.valid)
                  ? null
                  : Border(
                      bottom: BorderSide(color: ColorsApp.inputError, width: 2),
                    ),
              color: ColorsApp.inputBackground,
            ),
            padding: EdgeInsets.only(left: 16, right: 16),
            alignment: Alignment.centerLeft,
            child: StreamBuilder<bool>(
              stream: isFocus.stream,
              builder: (context, snapshot) {
                bool _data = snapshot.data ?? false;
                return Stack(
                  children: [
                    AnimatedPositioned(
                      top: _data ? 7 : 15.5,
                      child: Text(
                        widget.hint,
                        maxLines: 1,
                        style: TextStylesApp.pragmatica400(
                          _data ? 14 : 20,
                          color: ColorsApp.inputHint,
                          lineHeight: 1.2,
                        ),
                      ),
                      duration: ConstantsApp.durationInputTap,
                    ),
                    Positioned(
                      top: _data ? 12 : 4.5,
                      child: Container(
                        padding: EdgeInsets.only(right: widget.inputType == InputType.pass ? 20 : 0),
                        width: ConstantsApp.mainSize(context).width - 64,
                        child: TextField(
                          focusNode: widget.focusNode,
                          controller: widget.controller,
                          maxLines: 1,
                          inputFormatters: [
                            widget.inputType.toFormat,
                            LengthLimitingTextInputFormatter(widget.maxLength),
                          ],
                          minLines: 1,
                          onChanged: (value) {
                            setState(() {
                              validation = InputValidation.valid;
                              error = null;
                            });
                            if (widget.onChange != null) {
                              widget.onChange!.call(value);
                            }
                            isFocus.add(true);
                            setState(() {
                              if (value.length > 0) {
                                if (widget.equalTextFromController != null) {
                                  if (!(value.length == widget.equalTextFromController!.text.length) ||
                                      !widget.equalTextFromController!.text.contains(value)) {
                                    validation = InputValidation.error;
                                    error = 'Не верный пароль';
                                  } else {
                                    validateInput();
                                  }
                                }
                              } else {
                                if (widget.require) {
                                  validation = InputValidation.none;
                                }
                              }
                            });
                          },
                          onSubmitted: (value) {
                            if (widget.onSubmit != null) {
                              widget.onSubmit!.call(value);
                            }
                          },
                          autocorrect: false,
                          keyboardType: widget.inputType.toKeyboard,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                          obscureText: !showText,
                          cursorColor: ColorsApp.inputText,
                          cursorHeight: 22,
                          style: TextStylesApp.pragmatica400(
                            20,
                            color: validation == InputValidation.valid ? ColorsApp.inputText : ColorsApp.inputError,
                            lineHeight: 1.2,
                          ),
                        ),
                      ),
                    ),
                    if (widget.inputType == InputType.pass)
                      Positioned(
                        right: 0,
                        top: 15,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              showText = !showText;
                            });
                          },
                          child: Container(
                            width: 16,
                            height: 22,
                            child: SvgPicture.asset(
                              AppPicture.eyeClosedIcon,
                              fit: BoxFit.fitWidth,
                              color: ColorsApp.inputHint,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          if (validation != InputValidation.valid)
            Container(
              margin: EdgeInsets.only(top: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                error ?? validation.toErrorText,
                style: TextStylesApp.pragmatica300(
                  14,
                  color: ColorsApp.inputError,
                  lineHeight: 1.2,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void listenerFocus() {
    try {
      if (widget.controller.text == '') {
        if (!focusNode.hasFocus && widget.require) {
          setState(() {
            validation = InputValidation.none;
          });
        }
        isFocus.add(focusNode.hasFocus);
      } else {
        validateInput();
      }
    } catch (e) {
      deactivate();
    }
  }

  void validateInput() {
    setState(() {
      error = null;
      validation = InputValidation.valid;
    });
    if (widget.controller.text.length > 0) {
      switch (widget.inputType) {
        case InputType.email:
          var regExp = InputType.email.toRegExp;
          setState(() {
            if (regExp.hasMatch(widget.controller.text)) {
              validation = InputValidation.valid;
              error = widget.error;
            } else {
              validation = InputValidation.inValid;
              error = 'Не корректный email';
            }
          });
          break;
        case InputType.pass:
          if (widget.equalTextFromController == null) {
            setState(() {
              if (widget.controller.text.length > 7) {
                validation = InputValidation.valid;
                error = widget.error;
              } else {
                validation = InputValidation.inValid;
                error = 'Длина пароля должна быть не менее 8 символов';
              }
            });
          }
          break;
        default:
          break;
      }
    } else {
      if (widget.require) validation = InputValidation.none;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
