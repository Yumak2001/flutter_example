import 'package:carousel_slider/carousel_slider.dart';
import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:faneron_mobile/src/core/presentation/entities/main_item.dart';
import 'package:faneron_mobile/src/core/presentation/widget/image/border_image.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpositionPageCarouselWidget extends StatefulWidget {
  @override
  _ExpositionPageCarouselWidgetState createState() => _ExpositionPageCarouselWidgetState();
}

class _ExpositionPageCarouselWidgetState extends State<ExpositionPageCarouselWidget> {
  final carouselController = CarouselController();

  final List<MainPageItemImageTitleDescription> listItemExposition = [
    MainPageItemImageTitleDescription(
      image: AppPicture.mainPageExposition1,
      title: 'Гиперзеркало 2.0',
      description:
          'Переходи в другой мир и почувствуй себя главным героем комикса. Скачивай фото и видео из путешествия и делись ими с друзьями.',
    ),
    MainPageItemImageTitleDescription(
      image: AppPicture.mainPageExposition2,
      title: 'Метавселенная Фанерона',
      description:
          'Погружайся в виртуальную реальность, чтобы оказаться внутри сна, создать собственный цифровой шедевр или увидеть Фанерон с высоты птичьего полета.',
    ),
    MainPageItemImageTitleDescription(
      image: AppPicture.mainPageExposition3,
      title: 'Цифровое дерево',
      description: 'Перенесись во времени, раскрой тайну прошлого Фанерона и узнай сакральное значение артефактов.',
    ),
    MainPageItemImageTitleDescription(
      image: AppPicture.mainPageExposition4,
      title: 'Стена историй',
      description: 'Стань соавтором комикса и повлияй на ход истории города Фанерон.',
    ),
    MainPageItemImageTitleDescription(
      image: AppPicture.mainPageExposition5,
      title: 'Конструктор Комиксов',
      description: 'Создавай собственные истории и скачивай готовый комикс на свой гаджет.',
    ),
    MainPageItemImageTitleDescription(
      image: AppPicture.mainPageExposition6,
      title: 'Аркадные игры',
      description: 'Участвуй в увлекательных соревнованиях Фанерона, набирай очки и стань лучшим игроком.',
    ),
    MainPageItemImageTitleDescription(
      image: AppPicture.mainPageExposition7,
      title: 'Карта города',
      description: 'Окунись в увлекательную жизнь Фанерона и узнай, чем живут его жители.',
    ),
    MainPageItemImageTitleDescription(
      image: AppPicture.mainPageExposition8,
      title: 'Музыка Фанерона',
      description: 'Рисуй музыкой и управляй звуками, чтобы создать собственный аудиовизуальный перфоманс.',
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          carouselController: carouselController,
          items: [
            ...listItemExposition.map((e) => _expositionViewItem(e, context)).toList(),
          ],
          options: CarouselOptions(
            height: 425,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          height: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [...listItemExposition.map((e) => bottomCircle(listItemExposition.indexOf(e))).toList()],
          ),
        ),
      ],
    );
  }

  Widget _expositionViewItem(MainPageItemImageTitleDescription item, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15, left: 16, right: 16),
      width: ConstantsApp.mainSize(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderImageWidget(
            image: item.image,
            borderColor: ColorsApp.borderLight,
            height: (ConstantsApp.mainSize(context).width - 32) * 0.66,
          ),
          SizedBox(height: 20),
          Text(
            item.title.toUpperCase(),
            style: TextStylesApp.drukTextCyr500(28, lineHeight: 1.1),
          ),
          SizedBox(height: 10),
          Text(
            item.description,
            style: TextStylesApp.pragmatica400(18, lineHeight: 1.35),
          ),
        ],
      ),
    );
  }

  Widget bottomCircle(int index) {
    return GestureDetector(
      onTap: () {
        scrollTo(index);
      },
      child: Container(
        margin: EdgeInsets.only(left: 2, right: 2),
        child: AnimatedContainer(
          height: 6,
          width: 6,
          padding: EdgeInsets.all(0.5),
          decoration: BoxDecoration(
            gradient: ColorsApp.gradientBackgroundHorizontal,
            borderRadius: BorderRadius.circular(3),
          ),
          duration: ConstantsApp.durationAnimatedMainCarousel,
          child: Container(
            decoration: BoxDecoration(
              color: index == currentIndex ? Colors.transparent : ColorsApp.backgroundMainPage,
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),
        ),
      ),
    );
  }

  void scrollTo(int index) {
    if (index == currentIndex) {
      return;
    }
    carouselController.animateToPage(
      index,
      duration: ConstantsApp.durationAnimatedMainCarousel,
      curve: Curves.easeIn,
    );
  }
}
