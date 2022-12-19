import 'package:carousel_slider/carousel_slider.dart';
import 'package:faneron_mobile/src/common/controller/scrolls.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/screens/exposition/exposition.dart';
import 'package:faneron_mobile/src/core/presentation/widget/button/button.dart';
import 'package:faneron_mobile/src/core/presentation/widget/image/border_image.dart';
import 'package:faneron_mobile/src/core/presentation/widget/text/drop_cap.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpositionPageBody extends StatelessWidget {
  ExpositionPageBody({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: context.read<ScrollProvider>().expositionPageBodyController,
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 40, bottom: 16),
            child: Text(
              'Экспозиция'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStylesApp.drukCyr500(100, lineHeight: 0.9),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: CarouselSlider(
            items: [
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: BorderImageWidget(
                  image: AppPicture.expositionMain1,
                  borderColor: ColorsApp.borderLight,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: BorderImageWidget(
                  image: AppPicture.expositionMain2,
                  borderColor: ColorsApp.borderLight,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: BorderImageWidget(
                  image: AppPicture.expositionMain3,
                  borderColor: ColorsApp.borderLight,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
            options: CarouselOptions(
              height: 160,
              viewportFraction: 0.8,
              aspectRatio: 2.144,
              enlargeCenterPage: true,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                DropCapTextWidget(
                  text:
                      'Масштабное интерактивное пространство, где можно погрузиться в другие вселенные, открыть мир технологий, участвовать в виртуальных сражениях и стать главным героем необычных перфомансов.',
                  size: 20.0,
                  dropSize: 70,
                  margin: EdgeInsets.only(top: 16, bottom: 16),
                  dropWith: 47,
                  dropHeight: 67,
                  dropMargin: EdgeInsets.only(top: 7, bottom: 7, right: 12),
                  dropPadding: EdgeInsets.only(top: 2),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: ColorsApp.gradientBackgroundHorizontal,
                  ),
                  height: 1,
                  margin: EdgeInsets.only(top: 19, bottom: 25),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: ExpositionPageCarouselWidget(),
        ),
        SliverPadding(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                ButtonWidget(
                  title: 'Купить Билет',
                  onTap: () {
                    BlocProvider.of<RouterCubit>(context).onRouteToBuyTicketExposition();
                  },
                  margin: EdgeInsets.symmetric(vertical: 20),
                  gradient: true,
                  light: true,
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
