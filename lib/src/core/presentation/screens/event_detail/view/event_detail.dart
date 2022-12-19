import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:faneron_mobile/src/core/presentation/screens/event_detail/event_detail.dart';
import 'package:faneron_mobile/src/core/presentation/widget/appBar/second_app_bar.dart';
import 'package:faneron_mobile/src/core/presentation/widget/button/button.dart';
import 'package:faneron_mobile/src/core/presentation/widget/element/loader.dart';
import 'package:faneron_mobile/src/extension/date_time.dart';
import 'package:faneron_mobile/src/resource/keys.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventDetailPage extends StatefulWidget {
  static const id = '/eventDetail';
  EventDetailPage({
    required Key key,
  }) : super(key: key);

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: EventDetailPageKeys.scaffold,
      backgroundColor: ColorsApp.backgroundMainPage,
      body: BlocBuilder<EventDetailCubit, EventDetailState>(
        builder: (context, state) {
          return Column(
            children: [
              SecondAppBarWidget(
                keyPage: 'EventDetailPage',
                title: state.event?.title ?? 'Лаборатория',
                onTapBack: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: Container(
                  color: ColorsApp.backgroundLaboratoryPage,
                  child: (state.event == null)
                      ? Container(
                          child: Center(
                            child: LoaderWidget(),
                          ),
                        )
                      : CustomScrollView(
                          slivers: [
                            SliverPadding(
                              padding: EdgeInsets.only(
                                top: 16,
                                left: 16,
                                right: 16,
                                bottom: 25,
                              ),
                              sliver: SliverList(
                                delegate: SliverChildListDelegate(
                                  [
                                    Container(
                                      padding: EdgeInsets.all(1),
                                      color: ColorsApp.borderDark,
                                      child: FancyShimmerImage(
                                        errorWidget: Container(color: Colors.grey, height: 173),
                                        boxDecoration:
                                            BoxDecoration(border: Border.all(color: ColorsApp.borderDark, width: 1)),
                                        width: double.maxFinite,
                                        height: 173,
                                        boxFit: BoxFit.fitHeight,
                                        imageUrl: state.event!.imageUrl, //Нет на бэке
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                          margin: EdgeInsets.symmetric(vertical: 16),
                                          color: ColorsApp.backgroundItemActive,
                                          child: Container(
                                            child: Text(
                                              DateTimeToString.eventStartFinishTime(
                                                      state.event!.startEvent, state.event!.finishEvent)
                                                  .toUpperCase(),
                                              style: TextStylesApp.drukTextCyr500(
                                                20,
                                                color: ColorsApp.textBlack,
                                                lineHeight: 1.1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      state.event!.title,
                                      maxLines: 4,
                                      style: TextStylesApp.drukTextCyr500(
                                        28,
                                        color: ColorsApp.textDark,
                                        lineHeight: 1.1,
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    html.Html(
                                      data: '''${state.event!.description}''',
                                      style: {
                                        "p": html.Style.fromTextStyle(
                                          TextStylesApp.pragmatica400(
                                            18,
                                            color: ColorsApp.textDark,
                                            lineHeight: 1.35,
                                          ),
                                        ),
                                      },
                                    ),
                                    SizedBox(height: 16),
                                    ButtonWidget(
                                      title: state.thisPay ? 'Уже есть регистрация' : 'Зарегистрироваться',
                                      loading: state.loadButton,
                                      light: state.thisPay,
                                      active: !state.thisPay,
                                      onTap: () {
                                        BlocProvider.of<EventDetailCubit>(context).onTapRegistration();
                                      },
                                      height: 54,
                                      margin: EdgeInsets.symmetric(vertical: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
