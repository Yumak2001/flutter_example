import 'package:faneron_mobile/src/common/controller/scrolls.dart';
import 'package:faneron_mobile/src/core/presentation/entities/navigation_item.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/widget/image/border_image.dart';
import 'package:faneron_mobile/src/resource/icons.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationPageBody extends StatelessWidget {
  NavigationPageBody({required Key key}) : super(key: key);

  final List<NavigationItem> items = [
    NavigationItem(
        number: 1,
        text:
            'Войдя на территорию ВДНХ, двигайся прямо по Центральной аллее, мимо фонтанов «Дружба народов» и «Каменный цветок» в сторону площади Промышленности.'),
    NavigationItem(number: 2, text: 'Павильон «Космос» находится за ракетой «Восток». Прогулка займет 25-30 минут.'),
    NavigationItem(
        number: 3,
        text:
            'Тебе нужен вход со стороны Нальчикского сквера. Для этого нужно обогнуть павильон.\n\nОбрати внимание. Если собираешься купить билет на площадке, то сначала нужно заглянуть в кассу павильона «Космос». Она находится у главного входа.'),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: context.read<ScrollProvider>().navigationPageBodyController,
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                Text(
                  'Как добраться'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStylesApp.drukCyr500(
                    84,
                    lineHeight: 0.90,
                    color: ColorsApp.text,
                  ),
                ),
                BorderImageWidget(
                  image: AppPicture.navigationMain,
                  borderColor: ColorsApp.borderLight,
                  margin: EdgeInsets.only(top: 24, bottom: 24),
                ),
                ...items.map((e) => _navItemToWidget(e)).toList(),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          AppIcons.calendar,
                          size: 26,
                          color: ColorsApp.text,
                        ),
                      ),
                      Text(
                        'ВТОРНИК – ВОСКРЕСЕНЬЕ'.toUpperCase(),
                        style: TextStylesApp.drukTextCyr500(
                          28,
                          lineHeight: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          AppIcons.clock,
                          size: 26,
                          color: ColorsApp.text,
                        ),
                      ),
                      Text(
                        'С 11:00 ДО 22:00'.toUpperCase(),
                        style: TextStylesApp.drukTextCyr500(
                          28,
                          lineHeight: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      context.read<RouterCubit>().onRouteToBuyTicketExposition();
                    },
                    child: Container(
                      height: 48,
                      color: ColorsApp.backgroundButtonAccent,
                      alignment: Alignment.center,
                      child: Text(
                        'Купить билет'.toUpperCase(),
                        style: TextStylesApp.drukTextCyr500(
                          20,
                          lineHeight: 1.1,
                          color: ColorsApp.textBlack,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _navItemToWidget(NavigationItem item) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 85,
            child: Text(
              'Шаг ${item.number}'.toUpperCase(),
              style: TextStylesApp.drukTextCyr500(
                28,
                lineHeight: 1.1,
              ),
            ),
          ),
          Expanded(
            child: Text(
              item.text,
              style: TextStylesApp.pragmatica400(
                20,
                lineHeight: 1.35,
              ),
            ),
          )
        ],
      ),
    );
  }
}
