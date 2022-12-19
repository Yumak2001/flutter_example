import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:flutter/material.dart';

class GoldTicketButton extends StatefulWidget {
  final Function onTap;

  const GoldTicketButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<GoldTicketButton> createState() => _GoldTicketButtonState();
}

class _GoldTicketButtonState extends State<GoldTicketButton> {
  bool first = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (_) {
        setState(() {
          first = true;
        });
      },
      onLongPressUp: () {
        setState(() {
          first = false;
        });
      },
      onTap: () async {
        widget.onTap();
        setState(() {
          first = true;
        });
        await Future.delayed(Duration(milliseconds: 700));
        setState(() {
          first = false;
        });
      },
      child: Container(
        height: 77,
        child: Row(
          children: [
            AnimatedRotation(
                alignment: Alignment.topLeft,
                duration: Duration(milliseconds: 100),
                turns: !first ? 0.0 : -0.005,
                child: Image.asset(AppPicture.goldTicketButton)),
            AnimatedRotation(
                alignment: Alignment.bottomRight,
                duration: Duration(milliseconds: 100),
                turns: !first ? 0.0 : 0.03,
                child: Image.asset(AppPicture.goldTicketButtonEdge)),
          ],
        ),
      ),
    );
  }
}
