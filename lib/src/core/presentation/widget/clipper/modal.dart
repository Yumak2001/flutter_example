import 'package:flutter/cupertino.dart';

class ModalBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 10;

    Path path = Path();
    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, 0);
    path.arcToPoint(Offset(size.width, radius), radius: Radius.circular(radius), clockwise: false);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, radius);
    path.arcToPoint(Offset(radius, 0), radius: Radius.circular(radius), clockwise: false);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
