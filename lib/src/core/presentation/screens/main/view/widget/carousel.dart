import 'package:carousel_slider/carousel_slider.dart';
import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:faneron_mobile/src/core/presentation/entities/main_item.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';

class MainPageCarouselSliderWidget extends StatefulWidget {
  @override
  _MainPageCarouselSliderWidgetState createState() => _MainPageCarouselSliderWidgetState();
}

class _MainPageCarouselSliderWidgetState extends State<MainPageCarouselSliderWidget> {
  final controllerCarousel = CarouselController();

  int currentIndex = 0;

  final List<MainPageItemImageTitleDescription> listItemMain = [
    MainPageItemImageTitleDescription(
      image: AppPicture.mainPageItem1,
      title: 'Креативное арт-пространство',
      description: 'Возможность создать собственный уникальный комикс и менять мир вокруг.',
    ),
    MainPageItemImageTitleDescription(
      image: AppPicture.mainPageItem2,
      title: 'Насыщенная программа',
      description: 'Мастер-классы, лекции и воркшопы от экспертов креативной индустрии.',
    ),
    MainPageItemImageTitleDescription(
      image: AppPicture.mainPageItem3,
      title: 'Полное погружение',
      description: 'Масштабные инсталляции, мультимедийные пространства и дополненная реальность.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: Column(
        children: [
          Container(
            height: 64,
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                imageItem(0),
                imageItem(1),
                imageItem(2),
              ],
            ),
          ),
          SizedBox(height: 24),
          CarouselSlider(
            options: CarouselOptions(
              height: 136,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            carouselController: controllerCarousel,
            items: [
              contentItem(0),
              contentItem(1),
              contentItem(2),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 10),
            height: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                bottomCircle(0),
                bottomCircle(1),
                bottomCircle(2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget imageItem(int index) {
    return GestureDetector(
      onTap: () {
        scrollTo(index);
      },
      child: Container(
        height: 64,
        width: 64,
        color: Colors.transparent,
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: ConstantsApp.durationAnimatedMainCarousel,
          height: index == currentIndex ? 64 : 30,
          width: index == currentIndex ? 64 : 30,
          child: AnimatedOpacity(
            duration: ConstantsApp.durationAnimatedMainCarousel,
            opacity: index == currentIndex ? 1.0 : 0.6,
            child: Image.asset(
              listItemMain[index].image,
              width: index == currentIndex ? 64 : 30,
              height: index == currentIndex ? 64 : 30,
            ),
          ),
        ),
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

  Widget contentItem(int index) {
    return Container(
      height: 140,
      margin: EdgeInsets.only(left: 16, right: 16),
      width: ConstantsApp.mainSize(context).width - 32,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            listItemMain[index].title,
            style: TextStylesApp.drukTextCyr500(32),
          ),
          SizedBox(height: 16),
          Text(
            listItemMain[index].description,
            style: TextStylesApp.pragmatica400(20, lineHeight: 1.35),
          ),
        ],
      ),
    );
  }

  void scrollTo(int index) {
    if (index == currentIndex) {
      return;
    }
    controllerCarousel.animateToPage(
      index,
      duration: ConstantsApp.durationAnimatedMainCarousel,
      curve: Curves.easeIn,
    );
  }
}
