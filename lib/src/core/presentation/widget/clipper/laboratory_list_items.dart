import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:flutter/cupertino.dart';

class LaboratoryTagListClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, 3);
    double thisPosition = 3;
    for (int i = 0; i < 6; i++) {
      path.lineTo(size.width, thisPosition++);
      path.arcToPoint(Offset(size.width, thisPosition += 4),
          radius: Radius.circular(2), clockwise: false);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height - 2);
    thisPosition = size.height - 2;
    for (int i = 0; i < 6; i++) {
      path.lineTo(0, thisPosition--);
      path.arcToPoint(Offset(0, thisPosition -= 4),
          radius: Radius.circular(2), clockwise: false);
    }
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class LaboratoryDateListClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 9;
    Path path = Path();
    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, 0);
    path.arcToPoint(Offset(size.width, radius),
        radius: Radius.circular(radius), clockwise: false);
    double thisPosition = radius;
    for (int i = 0; i < 5; i++) {
      path.lineTo(size.width, thisPosition += 2);
      path.arcToPoint(Offset(size.width, thisPosition += 4),
          radius: Radius.circular(2), clockwise: false);
    }
    path.lineTo(size.width, size.height - radius);
    path.arcToPoint(Offset(size.width - radius, size.height),
        radius: Radius.circular(radius), clockwise: false);
    path.lineTo(radius, size.height);
    path.arcToPoint(Offset(0, size.height - radius),
        radius: Radius.circular(radius), clockwise: false);
    thisPosition = size.height - radius;
    for (int i = 0; i < 5; i++) {
      path.lineTo(0, thisPosition -= 2);
      path.arcToPoint(Offset(0, thisPosition -= 4),
          radius: Radius.circular(2), clockwise: false);
    }
    path.lineTo(0, radius);
    path.arcToPoint(Offset(radius, 0),
        radius: Radius.circular(radius), clockwise: false);
    return path;
    path.lineTo(size.width, 0);
    path.lineTo(size.width, 3);
    for (int i = 0; i < 6; i++) {
      path.lineTo(size.width, thisPosition++);
      path.arcToPoint(Offset(size.width, thisPosition += 4),
          radius: Radius.circular(2), clockwise: false);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height - 2);
    thisPosition = size.height - 2;
    for (int i = 0; i < 6; i++) {
      path.lineTo(0, thisPosition--);
      path.arcToPoint(Offset(0, thisPosition -= 4),
          radius: Radius.circular(2), clockwise: false);
    }
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
