import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/screens/image_picker/image_picker.dart';
import 'package:faneron_mobile/src/core/presentation/widget/button/button.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';

class ImagePickerPageBody extends StatefulWidget {
  final String path;
  ImagePickerPageBody({
    required Key key,
    required this.path,
  }) : super(key: key);

  @override
  _ImagePickerPageBodyState createState() => _ImagePickerPageBodyState();
}

class _ImagePickerPageBodyState extends State<ImagePickerPageBody> {
  bool isOpen = true;

  @override
  void initState() {
    isOpen = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ImagePickerCubit, ImagePickerState>(
        builder: (context, state) {
          if (isOpen) {
            cropped(widget.path, context);
            isOpen = false;
          }
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: ColorsApp.backgroundMainPage,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 230,
                  width: 230,
                  color: ColorsApp.backgroundMainPage,
                  margin: EdgeInsets.only(bottom: 24),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      DottedBorder(
                        dashPattern: [8, 8],
                        strokeWidth: 2,
                        color: ColorsApp.borderImage,
                        radius: Radius.circular(200),
                        borderType: BorderType.Circle,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: GestureDetector(
                            onTap: () async {
                              cropped(widget.path, context);
                            },
                            child: Image.file(
                              File(state.resultPath ?? widget.path),
                              height: 230,
                              width: 230,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (state.successUpdate)
                  Container(
                    padding: EdgeInsets.only(bottom: 24),
                    alignment: Alignment.center,
                    child: Text(
                      'Фото профиля изменено.',
                      textAlign: TextAlign.center,
                      style: TextStylesApp.pragmatica400(
                        18,
                        color: ColorsApp.text,
                        lineHeight: 1.35,
                      ),
                    ),
                  ),
                ButtonWidget(
                  title: state.successUpdate ? 'Закрыть' : 'Сохранить',
                  margin: EdgeInsets.symmetric(vertical: 6),
                  loading: state.buttonLoad,
                  onTap: () async {
                    if (state.successUpdate) {
                      BlocProvider.of<RouterCubit>(context).onPop();
                    }
                    if (state.resultPath != null) {
                      BlocProvider.of<ImagePickerCubit>(context).sendImage(state.resultPath!);
                    }
                  },
                  height: 58,
                ),
                if (!state.successUpdate)
                  ButtonWidget(
                    title: 'Отменить',
                    border: false,
                    margin: EdgeInsets.symmetric(vertical: 6),
                    onTap: () {
                      BlocProvider.of<RouterCubit>(context).onPop();
                    },
                    height: 58,
                    colorTitle: ColorsApp.text.withOpacity(0.4),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> cropped(String path, BuildContext context) async {
    var resultPatch = await ImageCropper().cropImage(
      sourcePath: path,
      maxHeight: 1025,
      maxWidth: 1024,
      cropStyle: CropStyle.circle,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Обрезать изображение',
          toolbarColor: ColorsApp.appBarBackground,
          toolbarWidgetColor: ColorsApp.appBarIconColor,
          initAspectRatio: CropAspectRatioPreset.original,
          backgroundColor: ColorsApp.backgroundMainPage,
          cropFrameColor: ColorsApp.borderImage,
          lockAspectRatio: false,
          activeControlsWidgetColor: ColorsApp.textAccent,
        ),
        IOSUiSettings(
          title: 'Обрезать изображение',
          doneButtonTitle: 'Готово',
          cancelButtonTitle: 'Назад',
        ),
      ],
    );
    if (resultPatch != null) {
      BlocProvider.of<ImagePickerCubit>(context).onTapImage(resultPatch.path);
      return;
    } else {
      BlocProvider.of<RouterCubit>(context).onPop();
    }
  }
}
