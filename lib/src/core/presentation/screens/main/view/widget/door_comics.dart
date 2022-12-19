import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widget/button/button.dart';

class MainDoorComicsWidget extends StatefulWidget {
  @override
  _MainDoorComicsWidgetState createState() => _MainDoorComicsWidgetState();
}

class _MainDoorComicsWidgetState extends State<MainDoorComicsWidget> {
  double width = 0;
  late double widthDoor;
  late double positionDoor;
  late double height;

  bool animated = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (width == 0) {
      width = MediaQuery.of(context).size.width;
      widthDoor = MediaQuery.of(context).size.width * 0.66992;
      positionDoor = (width - widthDoor) / 2;
      height = width * 1.5;
    }
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (!animated) {
              setState(() {
                animated = true;
                positionDoor -= widthDoor / 2;
              });
            }
          },
          child: Container(
            width: width,
            height: height,
            child: Stack(
              children: [
                Positioned(
                  child: Image.asset(
                    AppPicture.mainDoorText,
                    fit: BoxFit.fitWidth,
                    width: width - 58,
                  ),
                  left: 58 / 2,
                  bottom: 0,
                ),
                Positioned(
                  child: Container(
                    height: 1,
                    width: width - 32,
                    color: Colors.white,
                  ),
                  left: 16,
                  bottom: 0,
                ),
                Positioned(
                  child: Image.asset(
                    AppPicture.mainDoorBackground,
                    fit: BoxFit.fitWidth,
                    width: width,
                  ),
                  bottom: 0,
                ),
                AnimatedPositioned(
                  duration: ConstantsApp.durationDoorAnimation,
                  curve: Curves.easeIn,
                  child: Image.asset(
                    AppPicture.mainDoorL,
                    width: widthDoor / 2,
                  ),
                  bottom: 0,
                  left: positionDoor,
                  onEnd: () async {
                    if (animated) {
                      BlocProvider.of<RouterCubit>(context).onRouteToComics();
                      await Future.delayed(Duration(milliseconds: 200));
                      setState(() {
                        animated = false;
                        positionDoor += widthDoor / 2;
                      });
                    }
                  },
                ),
                AnimatedPositioned(
                  duration: ConstantsApp.durationDoorAnimation,
                  curve: Curves.easeIn,
                  child: Image.asset(
                    AppPicture.mainDoorR,
                    width: widthDoor / 2,
                    fit: BoxFit.fitWidth,
                  ),
                  bottom: 0,
                  right: positionDoor,
                ),
                Positioned(
                  child: Image.asset(
                    AppPicture.mainDoorArrow,
                    width: width * 0.2293,
                  ),
                  bottom: width * 1.22,
                  right: width * 0.128,
                ),
                Positioned(
                  child: Text(
                    'Погрузитесь в мир\nкомиксов Фанерона',
                    style: TextStylesApp.pragmatica400(18).copyWith(fontStyle: FontStyle.italic),
                  ),
                  bottom: width * 1.38,
                  right: 16,
                ),
              ],
            ),
          ),
        ),
        ButtonWidget(
          title: 'ЧИТАТЬ КОМИКСЫ',
          onTap: () {
            if (!animated) {
              setState(() {
                animated = true;
                positionDoor -= widthDoor / 2;
              });
            }
          },
          light: true,
          margin: EdgeInsets.only(top: 20, bottom: 45, left: 16, right: 16),
          gradient: true,
          height: 54,
        ),
      ],
    );
  }
}
