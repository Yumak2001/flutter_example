import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:faneron_mobile/src/core/presentation/widget/clipper/scratch_background_top.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';

class BackgroundMountBodyScroll extends StatelessWidget {
  final List<Widget> slivers;
  final Stream<double> stream;
  final ScrollController controller;
  BackgroundMountBodyScroll({
    this.slivers = const [],
    required this.stream,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.backgroundMainPage,
      child: Stack(
        children: [
          Positioned.fill(
            child: StreamBuilder<double>(
                stream: stream,
                builder: (context, snapshot) {
                  double position = 1;
                  if (snapshot.data != null) {
                    if (snapshot.data! < 0.0) {
                      position = snapshot.data!.abs() + 1;
                    } else {
                      if (snapshot.data! < 1) {
                        position = 1 - snapshot.data!;
                      } else {
                        position = 0.0;
                      }
                    }
                  }
                  return Container(
                    margin: EdgeInsets.only(top: position),
                    color: ColorsApp.backgroundLaboratoryPage,
                  );
                }),
          ),
          CustomScrollView(
            controller: controller,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorsApp.backgroundLaboratoryPage,
                              ),
                              margin: EdgeInsets.only(top: 1, bottom: 1),
                            ),
                            top: 0,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ScratchBackgroundTopClip(
                                      child: Container(
                                        height: 57,
                                        color: ColorsApp.backgroundMainPage,
                                      ),
                                    ),
                                    Positioned(
                                      top: 12,
                                      child: Container(
                                        width: ConstantsApp.mainSize(context).width,
                                        child: Image.asset(
                                          AppPicture.scratchBackgroundTop,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
              ...slivers,
            ],
          ),
        ],
      ),
    );
  }
}
