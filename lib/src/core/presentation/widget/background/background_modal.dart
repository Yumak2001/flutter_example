import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:faneron_mobile/src/core/presentation/widget/clipper/modal.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundModalWidget extends StatelessWidget {
  final Widget child;
  final double height;
  BackgroundModalWidget({
    required this.child,
    this.height = 519,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height + ConstantsApp.bottomViewPadding(context),
      child: ClipPath(
        clipper: ModalBorderClipper(),
        child: Container(
          color: ColorsApp.borderDark,
          padding: EdgeInsets.only(left: 1, top: 1, right: 1),
          child: ClipPath(
            clipper: ModalBorderClipper(),
            child: Container(
              color: ColorsApp.backgroundModal,
              padding: EdgeInsets.only(left: 5, top: 5, right: 5),
              child: ClipPath(
                clipper: ModalBorderClipper(),
                child: Container(
                  color: ColorsApp.borderDark,
                  padding: EdgeInsets.only(left: 1, top: 1, right: 1),
                  child: ClipPath(
                    clipper: ModalBorderClipper(),
                    child: Container(
                      color: ColorsApp.backgroundModal,
                      padding: EdgeInsets.only(bottom: ConstantsApp.bottomViewPadding(context)),
                      child: Container(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 14,
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  AppPicture.lineModalCloseIcon,
                                  height: 4,
                                  color: ColorsApp.textDark.withOpacity(0.4),
                                ),
                              ),
                            ),
                            Expanded(
                              child: child,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
