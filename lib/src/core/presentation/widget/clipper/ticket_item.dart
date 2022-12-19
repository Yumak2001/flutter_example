import 'package:flutter/cupertino.dart';

class TicketItemClipper extends CustomClipper<Path> {
  final bool internal;
  final double radius;
  final double offset;
  TicketItemClipper(
    this.internal, {
    required this.radius,
    required this.offset,
  });

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(offset, 0);
    if (!internal) {
      double thisPosition = ((size.width - 245) / 2) - 8;
      for (int i = 0; i < 11; i++) {
        path.lineTo(thisPosition += 8, 0);
        path.arcToPoint(Offset(thisPosition += 15, 0), radius: Radius.circular(15 / 2), clockwise: false);
      }
    }
    path.lineTo(size.width - offset, 0);
    path.arcToPoint(Offset(size.width, offset), radius: Radius.circular(radius), clockwise: false);
    path.lineTo(size.width, size.height - offset);
    path.arcToPoint(Offset(size.width - offset, size.height), radius: Radius.circular(radius), clockwise: false);
    path.lineTo(offset, size.height);
    path.arcToPoint(Offset(0, size.height - offset), radius: Radius.circular(radius), clockwise: false);
    path.lineTo(0, offset);
    path.arcToPoint(Offset(offset, 0), radius: Radius.circular(radius), clockwise: false);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
