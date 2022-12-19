import 'package:flutter/cupertino.dart';

class ScratchBackgroundTopClip extends StatelessWidget {
  final Widget child;
  ScratchBackgroundTopClip({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ScratchBackgroundTopClipper(),
      child: child,
    );
  }
}

class ScratchBackgroundTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.12, size.height * 0.83);
    path.cubicTo(size.width * 0.1, size.height * 0.83, size.width * 0.03, size.height * 0.95, 0, size.height);
    path.cubicTo(0, size.height, 0, 0, 0, 0);
    path.cubicTo(0, 0, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width, size.height * 0.91, size.width, size.height * 0.91);
    path.cubicTo(
        size.width, size.height * 0.91, size.width * 0.97, size.height * 0.94, size.width * 0.96, size.height * 0.96);
    path.cubicTo(
        size.width * 0.94, size.height, size.width * 0.9, size.height * 0.98, size.width * 0.88, size.height * 0.98);
    path.cubicTo(size.width * 0.86, size.height * 0.97, size.width * 0.82, size.height * 0.89, size.width * 0.81,
        size.height * 0.87);
    path.cubicTo(size.width * 0.79, size.height * 0.85, size.width * 0.78, size.height * 0.78, size.width * 0.77,
        size.height * 0.75);
    path.cubicTo(size.width * 0.76, size.height * 0.72, size.width * 0.76, size.height * 0.72, size.width * 0.75,
        size.height * 0.71);
    path.cubicTo(size.width * 0.74, size.height * 0.69, size.width * 0.72, size.height * 0.71, size.width * 0.7,
        size.height * 0.67);
    path.cubicTo(size.width * 0.68, size.height * 0.62, size.width * 0.66, size.height * 0.62, size.width * 0.64,
        size.height * 0.63);
    path.cubicTo(size.width * 0.61, size.height * 0.63, size.width * 0.6, size.height * 0.6, size.width * 0.58,
        size.height * 0.56);
    path.cubicTo(size.width * 0.56, size.height * 0.53, size.width * 0.53, size.height * 0.48, size.width * 0.52,
        size.height * 0.45);
    path.cubicTo(size.width * 0.51, size.height * 0.42, size.width * 0.48, size.height * 0.4, size.width * 0.46,
        size.height * 0.4);
    path.cubicTo(size.width * 0.45, size.height * 0.39, size.width * 0.43, size.height * 0.37, size.width * 0.42,
        size.height * 0.37);
    path.cubicTo(size.width * 0.4, size.height * 0.37, size.width * 0.37, size.height * 0.41, size.width * 0.35,
        size.height * 0.43);
    path.cubicTo(size.width * 0.35, size.height * 0.43, size.width * 0.24, size.height * 0.66, size.width * 0.24,
        size.height * 0.66);
    path.cubicTo(size.width / 5, size.height * 0.71, size.width * 0.13, size.height * 0.82, size.width * 0.12,
        size.height * 0.83);
    path.cubicTo(size.width * 0.12, size.height * 0.83, size.width * 0.12, size.height * 0.83, size.width * 0.12,
        size.height * 0.83);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
