import 'dart:async';

import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';

class LoaderWidget extends StatefulWidget {
  final bool inButton;
  final Color? color;
  LoaderWidget({
    this.inButton = false,
    this.color,
  });
  @override
  _LoaderWidgetState createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget> with TickerProviderStateMixin {
  double positioned = 0.0;

  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      if (timer.tick % 4 == 1) {
        setState(() {
          if (positioned == 0.0) {
            positioned = widget.inButton ? 91 : 87.0;
          } else {
            positioned = 0.0;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.inButton ? 10 : 100,
      width: widget.inButton ? 100 : 11,
      margin: EdgeInsets.only(bottom: widget.inButton ? 0 : 60),
      color: Colors.transparent,
      child: Stack(
        children: [
          AnimatedPositioned(
            top: widget.inButton ? 0 : positioned,
            left: widget.inButton ? positioned : 0,
            duration: Duration(milliseconds: 400),
            child: Container(
              height: widget.inButton ? 10 : 13,
              width: widget.inButton ? 9 : 11,
              color: widget.inButton ? (widget.color ?? ColorsApp.loaderButtonDark) : ColorsApp.loaderAccent,
            ),
            curve: Curves.bounceOut,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
