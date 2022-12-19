import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:faneron_mobile/src/core/presentation/screens/main/main.dart';
import 'package:faneron_mobile/src/core/presentation/widget/image/border_image.dart';
import 'package:provider/provider.dart';
import 'package:faneron_mobile/src/common/controller/scrolls.dart';
import 'package:faneron_mobile/src/core/presentation/widget/text/drop_cap.dart';
import 'package:faneron_mobile/src/resource/keys/main.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPageBody extends StatelessWidget {
  MainPageBody({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: MainPageKeys.bodyScrollList,
      controller: context.read<ScrollProvider>().mainPageBodyController,
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 38),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  child: Image.asset(
                    AppPicture.mainTitle,
                    fit: BoxFit.fitWidth,
                    height: 100,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 2),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Text(
                    'Твой портал в удивительную вселенную технологий, креатива и впечатлений.',
                    textAlign: TextAlign.center,
                    style: TextStylesApp.drukTextCyr500(30, lineHeight: 0.9),
                  ),
                ),
                Text(
                  'Москва, вднх'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStylesApp.drukCyr500italic(42),
                ),
                Text(
                  'Центр «Космонавтика и авиация»'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStylesApp.drukCyr500italic(42, color: ColorsApp.text.withOpacity(0.5)),
                ),
                SizedBox(height: 40),
                BorderImageWidget(
                  image: AppPicture.mainPageParallax,
                  borderColor: ColorsApp.borderLight,
                  height: ConstantsApp.mainSize(context).width - 32,
                ),
                DropCapTextWidget(
                  text:
                      'Танцевальные кибербатлы, аркадные соревнования, погружение в другие измерения, рисование музыкой, арт- перфомансы, встречи с художниками и иллюстраторами — всё это и многое другое ждет тебя здесь.\n\nИсследуй Фанерон и стань частью интерактивного мира будущего!',
                  size: 24.0,
                  dropSize: 80.0,
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 13,
                    top: 16,
                    bottom: 16,
                  ),
                  margin: EdgeInsets.only(top: 32, bottom: 40),
                  border: true,
                  dropWith: 50,
                  dropHeight: 78,
                  dropPadding: EdgeInsets.only(top: 8, bottom: 8),
                  dropMargin: EdgeInsets.only(top: 9, bottom: 9, right: 12),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: MainPageCarouselSliderWidget(),
        ),
        SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(
              gradient: ColorsApp.gradientBackgroundHorizontal,
            ),
            height: 1,
            margin: EdgeInsets.only(top: 10, bottom: 20, left: 16, right: 16),
          ),
        ),
        SliverToBoxAdapter(
          child: MainDoorComicsWidget(),
        ),
      ],
    );
  }
}
