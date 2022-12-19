import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';
import 'package:faneron_mobile/src/core/presentation/screens/image_picker/image_picker.dart';
import 'package:faneron_mobile/src/core/presentation/widget/appBar/second_app_bar.dart';
import 'package:faneron_mobile/src/core/presentation/widget/element/loader.dart';
import 'package:faneron_mobile/src/resource/keys.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerPage extends StatefulWidget {
  static const id = '/imagePicker';
  final String path;

  ImagePickerPage({
    required Key key,
    required this.path,
  }) : super(key: key);

  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ImagePickerPageKeys.scaffold,
      backgroundColor: ColorsApp.backgroundMainPage,
      body: Column(
        children: [
          SecondAppBarWidget(
            keyPage: 'ImagePickerPage',
            title: 'Фото профиля',
            iconBackOrCross: false,
            onTapBack: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: BlocBuilder<ImagePickerCubit, ImagePickerState>(
              builder: (context, state) {
                if (state.screenStatus == ScreenStatus.loading) {
                  return Container(
                    child: Center(
                      child: LoaderWidget(),
                    ),
                  );
                }
                return ImagePickerPageBody(
                  key: ImagePickerPageKeys.body,
                  path: widget.path,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
