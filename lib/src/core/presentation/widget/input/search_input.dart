import 'package:faneron_mobile/src/resource/icons.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchInputWidget extends StatefulWidget {
  final EdgeInsets margin;
  final double height;
  final FocusNode focus;
  final TextEditingController controller;
  final Function(String) onChange;

  SearchInputWidget({
    required Key key,
    this.margin = EdgeInsets.zero,
    this.height = 50,
    required this.focus,
    required this.controller,
    required this.onChange,
  });

  @override
  _SearchInputWidgetState createState() => _SearchInputWidgetState(controller);
}

class _SearchInputWidgetState extends State<SearchInputWidget> {
  final TextEditingController controller;
  _SearchInputWidgetState(
    this.controller,
  );

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  void listener() {
    widget.onChange.call(widget.controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: ColorsApp.borderDark),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16),
              alignment: Alignment.centerLeft,
              child: TextField(
                focusNode: widget.focus,
                controller: widget.controller,
                maxLines: 1,
                minLines: 1,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r"[^а-яА-Я\ \.\,]+")),
                  LengthLimitingTextInputFormatter(50),
                ],
                keyboardType: TextInputType.text,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: 'Поиск по формату или по теме...',
                  focusedBorder: InputBorder.none,
                  hintStyle: TextStylesApp.pragmatica400(
                    18,
                    color: ColorsApp.textBlack.withOpacity(0.4),
                    lineHeight: 1.35,
                  ),
                  border: InputBorder.none,
                ),
                cursorColor: ColorsApp.inputText,
                style: TextStylesApp.pragmatica400(
                  20,
                  color: ColorsApp.inputText,
                  lineHeight: 1.2,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (widget.controller.text != '') {
                widget.controller.clear();
                widget.focus.unfocus();
              }
            },
            child: Container(
              width: 50,
              height: 50,
              color: ColorsApp.borderDark,
              child: widget.controller.text == ''
                  ? Icon(
                      AppIcons.search,
                      size: 28,
                      color: ColorsApp.text,
                    )
                  : Container(
                      height: 20,
                      width: 20,
                      child: SvgPicture.asset(
                        AppPicture.crossIcon,
                        height: 20,
                        width: 20,
                        fit: BoxFit.fitWidth,
                        color: ColorsApp.iconLight,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
