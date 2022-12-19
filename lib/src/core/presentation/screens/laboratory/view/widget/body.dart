import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:faneron_mobile/src/common/controller/focus_text_field.dart';
import 'package:faneron_mobile/src/common/controller/scrolls.dart';
import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/screens/laboratory/laboratory.dart';
import 'package:faneron_mobile/src/core/presentation/widget/background/background_mount_body.dart';
import 'package:faneron_mobile/src/core/presentation/widget/button/button.dart';
import 'package:faneron_mobile/src/core/presentation/widget/element/loader.dart';
import 'package:faneron_mobile/src/core/presentation/widget/image/border_image.dart';
import 'package:faneron_mobile/src/core/presentation/widget/text/drop_cap.dart';
import 'package:faneron_mobile/src/extension/date_time.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaboratoryPageBody extends StatelessWidget {
  LaboratoryPageBody({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaboratoryCubit, LaboratoryState>(
      builder: (context, state) {
        return BackgroundMountBodyScroll(
          stream: context.read<ScrollProvider>().laboratoryPageBodyScrollOffset,
          controller: context.read<ScrollProvider>().laboratoryPageBodyController,
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(left: 16, right: 16),
              sliver: SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    Text(
                      'Лаборатория'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStylesApp.drukCyr500(
                        94,
                        lineHeight: 0.90,
                        color: ColorsApp.textBlack,
                      ),
                    ),
                    BorderImageWidget(
                      image: AppPicture.laboratoryContent1,
                      borderColor: ColorsApp.borderDark,
                      margin: EdgeInsets.only(top: 16, bottom: 16),
                      height: (ConstantsApp.mainSize(context).width - 32) * 0.46,
                    ),
                    DropCapTextWidget(
                      text:
                          'Творческая мастерская, где можно создавать свои комиксы, развивать таланты и посещать мастер-классы от художников, писателей, сценаристов и иллюстраторов. А еще здесь можно попробовать себя в чем-то новом и найти друзей по интересам.',
                      size: 20,
                      dropSize: 70,
                      dropWith: 47,
                      dropHeight: 67,
                      dropPadding: EdgeInsets.only(top: 4, left: 5, right: 5),
                      dropMargin: EdgeInsets.only(top: 7, right: 12, bottom: 7),
                      light: false,
                    ),
                  ],
                ),
              ),
            ),
            if (state.eventsViewList != null)
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: LaboratoryEventHeaderWidget(),
              ),
            SliverPadding(
              padding: (state.eventsViewList != null && state.eventsViewList!.isEmpty)
                  ? EdgeInsets.zero
                  : EdgeInsets.only(left: 16, right: 16),
              sliver: (state.eventsViewList != null)
                  ? (state.eventsViewList!.isEmpty)
                      ? SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 8, bottom: 23),
                                child: Text(
                                  'По вашему запросу мероприятия не найдены',
                                  style: TextStylesApp.pragmatica400(
                                    18,
                                    color: ColorsApp.textDark,
                                    lineHeight: 1.5,
                                  ),
                                ),
                              ),
                              Image.asset(
                                AppPicture.eventEmpty,
                                fit: BoxFit.fitWidth,
                              ),
                            ],
                          ),
                        )
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return Container(
                                padding: EdgeInsets.only(top: 15, bottom: 15),
                                child: GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<RouterCubit>(context)
                                        .onRouteToEventDetail(state.eventsViewList![index]);
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      FancyShimmerImage(
                                        errorWidget: Container(color: Colors.grey, height: 173),
                                        height: 173,
                                        width: double.maxFinite,
                                        boxFit: BoxFit.fitWidth,
                                        imageUrl: state.eventsViewList![index].imageUrl, //Нет на бэке
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 8, top: 11),
                                        child: Text(
                                          DateTimeToString.eventStartFinishTime(state.eventsViewList![index].startEvent,
                                              state.eventsViewList![index].finishEvent),
                                          style: TextStylesApp.pragmatica400(
                                            20,
                                            color: ColorsApp.textDark,
                                            lineHeight: 1.35,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        state.eventsViewList![index].title,
                                        maxLines: 4,
                                        style: TextStylesApp.drukTextCyr500(
                                          28,
                                          color: ColorsApp.textDark,
                                          lineHeight: 1.1,
                                        ),
                                      ),
                                      SizedBox(height: 14),
                                      ButtonWidget(
                                        title: state.eventsPayIds
                                                .any((element) => element == state.eventsViewList![index].id)
                                            ? 'Уже есть регистрация'
                                            : 'Зарегистрироваться',
                                        onTap: () {
                                          if (!state.eventsPayIds
                                              .any((element) => element == state.eventsViewList![index].id)) {
                                            context.read<FocusTextFieldProvider>().unFocusAll();
                                            BlocProvider.of<LaboratoryCubit>(context)
                                                .onTapRegistration(state.eventsViewList![index].id);
                                          }
                                        },
                                        active: state.eventLoadButtonId == '',
                                        loading: (state.eventLoadButtonId != '' &&
                                            state.eventLoadButtonId == state.eventsViewList![index].id),
                                        light: state.eventsPayIds
                                            .any((element) => element == state.eventsViewList![index].id),
                                        height: 54,
                                        margin: EdgeInsets.symmetric(vertical: 10),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            childCount: state.eventsViewList!.length,
                          ),
                        )
                  : SliverToBoxAdapter(
                      child: Container(
                        height: 200,
                        alignment: Alignment.center,
                        child: LoaderWidget(),
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }
}
