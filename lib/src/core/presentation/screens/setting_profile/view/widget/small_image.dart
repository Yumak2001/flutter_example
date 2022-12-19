import 'dart:io';

import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';

class ProfileSettingSmallImage extends StatelessWidget {
  final String image;
  final Function(String path) onTap;
  final bool isActive;

  ProfileSettingSmallImage({
    required this.image,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          if (!isActive) {
            final tempDir = await getTemporaryDirectory();
            final file = await new File('${tempDir.path}/image.png').create();
            final byteData = await rootBundle.load(image);
            file.writeAsBytesSync(byteData.buffer.asUint8List());
            onTap.call(file.path);
          }
        },
        child: Stack(
          children: [
            Container(
              height: 100,
              width: 100,
              padding: EdgeInsets.all(isActive ? 3.57 : 2.5),
              decoration: BoxDecoration(
                color: (isActive) ? ColorsApp.borderAccent : ColorsApp.borderImage,
                gradient: (isActive) ? null : ColorsApp.gradientBackground,
                borderRadius: BorderRadius.circular(100 / 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100 / 2),
                child: Image.asset(image),
              ),
            ),
            if (isActive)
              Positioned(
                bottom: 4,
                right: 4,
                child: Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                    color: ColorsApp.borderAccent,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: SvgPicture.asset(
                    AppPicture.itemBoxActive,
                    color: ColorsApp.borderDark,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
