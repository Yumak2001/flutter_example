import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/core/domain/entities/events.dart';
import 'package:faneron_mobile/src/core/presentation/widget/background/background_modal.dart';
import 'package:faneron_mobile/src/extension/date_time.dart';
import 'package:faneron_mobile/src/resource/icons.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageModal extends StatefulWidget {
  static String id = '/uploadImageModal';
  final Function(String path) callback;
  UploadImageModal(this.callback);

  @override
  _UploadImageModalState createState() => _UploadImageModalState();
}

class _UploadImageModalState extends State<UploadImageModal> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return BackgroundModalWidget(
      height: 296,
      child: Container(
        padding: EdgeInsets.all(11),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Загрузить фото',
                textAlign: TextAlign.center,
                style: TextStylesApp.drukTextCyr500(
                  32,
                  color: ColorsApp.textBlack,
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _item(
                    image: AppPicture.galleryIcon,
                    title: 'Из галереи',
                    onTap: () async {
                      var image = await _picker.getImage(source: ImageSource.gallery);
                      if (image != null) {
                        widget.callback.call(image.path);
                      }
                    },
                  ),
                  _item(
                    image: AppPicture.cameraIcon,
                    title: 'Сделать фото',
                    onTap: () async {
                      var image = await _picker.getImage(source: ImageSource.camera);
                      if (image != null) {
                        widget.callback.call(image.path);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item({required String image, required String title, required Function onTap}) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Container(
        height: 140,
        width: 140,
        margin: EdgeInsets.only(bottom: 40),
        decoration: BoxDecoration(
          color: ColorsApp.backgroundMainPage.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              width: 70,
              fit: BoxFit.fitWidth,
            ),
            Text(
              title,
              style: TextStylesApp.drukTextCyr500(
                18,
                color: ColorsApp.textDark,
                lineHeight: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
