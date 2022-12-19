import 'package:cached_network_image/cached_network_image.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';

class ProfileImageWidget extends StatelessWidget {
  final double size;
  final Color borderColor;
  final String? image;
  final bool isSelect;
  final EdgeInsets margin;
  final bool darkBorder;

  ProfileImageWidget({
    required this.image,
    this.borderColor = ColorsApp.borderDark,
    required this.size,
    this.isSelect = false,
    this.margin = EdgeInsets.zero,
    this.darkBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: margin,
        height: size,
        width: size,
        padding: (image != null) ? EdgeInsets.all(2) : EdgeInsets.zero,
        decoration: (image != null)
            ? BoxDecoration(
                color: borderColor,
                borderRadius: BorderRadius.circular(size / 2),
                gradient: (darkBorder) ? null : ColorsApp.gradientBackground,
              )
            : null,
        child: (image != null)
            ? ClipRRect(
                borderRadius: BorderRadius.circular(size / 2),
                child: CachedNetworkImage(imageUrl: image!),
              )
            : Image.asset(
                AppPicture.avaShimmer,
                height: size,
                width: size,
              ),
      ),
    );
  }
}
