import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuestionAnswerItem extends StatefulWidget {
  final String title;
  final String? bodyText;
  final bool isExpanded;
  final Function onTap;
  final RichText? richText;

  const QuestionAnswerItem({
    Key? key,
    required this.title,
    this.bodyText,
    required this.isExpanded,
    required this.onTap,
    this.richText,
  })  : assert(bodyText == null || richText == null, "bodyText or richText must be provided"),
        super(key: key);

  @override
  State<QuestionAnswerItem> createState() => _QuestionAnswerItemState();
}

class _QuestionAnswerItemState extends State<QuestionAnswerItem> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isExpanded)
      _controller.forward();
    else
      _controller.reverse();
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            widget.onTap();
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  widget.title.toUpperCase(),
                  style: TextStylesApp.drukTextCyr500(
                    28,
                    lineHeight: 1.1,
                  ),
                ),
              ),
              SizedBox(width: 30),
              AnimatedRotation(
                turns: widget.isExpanded ? 0.0 : 0.125,
                duration: Duration(milliseconds: 250),
                child: SvgPicture.asset(
                  AppPicture.crossIcon,
                  height: 42,
                  width: 42,
                  color: ColorsApp.backgroundButtonAccent,
                ),
              ),
            ],
          ),
        ),
        SizeTransition(
            sizeFactor: _controller,
            child: Padding(
              padding: EdgeInsets.only(top: 16),
              child: widget.richText ??
                  Text(
                    widget.bodyText!,
                    style: TextStylesApp.pragmatica400(20, lineHeight: 1.35),
                  ),
            )),
      ],
    );
  }
}
