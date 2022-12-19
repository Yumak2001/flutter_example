import 'package:flutter/cupertino.dart';

class BorderImageWidget extends StatelessWidget {
  final String image;
  final Color borderColor;
  final double borderWith;
  final EdgeInsets margin;
  final double? height;
  final double? width;
  final BoxFit fit;

  BorderImageWidget({
    required this.image,
    required this.borderColor,
    this.borderWith = 1,
    this.margin = EdgeInsets.zero,
    this.height,
    this.width,
    this.fit = BoxFit.fitWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(borderWith),
      height: height,
      width: width,
      margin: margin,
      color: borderColor,
      child: Image.asset(
        image,
        fit: fit,
      ),
    );
  }
}
