import 'package:flutter/material.dart';

class DialogBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = size.width / 19.78;

    Path path = Path();
    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, 0);
    path.arcToPoint(Offset(size.width, radius), radius: Radius.circular(radius), clockwise: false);
    path.lineTo(size.width, size.height - radius);
    path.arcToPoint(Offset(size.width - radius, size.height), radius: Radius.circular(radius), clockwise: false);
    path.lineTo(radius, size.height);
    path.arcToPoint(Offset(0, size.height - radius), radius: Radius.circular(radius), clockwise: false);
    path.lineTo(0, radius);
    path.arcToPoint(Offset(radius, 0), radius: Radius.circular(radius), clockwise: false);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
