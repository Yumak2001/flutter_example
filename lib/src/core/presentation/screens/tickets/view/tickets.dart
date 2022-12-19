import 'package:device_calendar/device_calendar.dart';
import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';
import 'package:faneron_mobile/src/core/presentation/screens/tickets/tickets.dart';
import 'package:faneron_mobile/src/core/presentation/widget/appBar/second_app_bar.dart';
import 'package:faneron_mobile/src/core/presentation/widget/element/loader.dart';
import 'package:faneron_mobile/src/resource/icons.dart';
import 'package:faneron_mobile/src/resource/keys.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketsPage extends StatefulWidget {
  static const id = '/tickets';
  TicketsPage({
    required Key key,
  }) : super(key: key);

  @override
  _TicketsPageState createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  DeviceCalendarPlugin deviceCalendarPlugin = DeviceCalendarPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: TicketsPageKeys.scaffold,
      backgroundColor: ColorsApp.backgroundMainPage,
      body: Column(
        children: [
          SecondAppBarWidget(
            keyPage: 'TicketsPage',
            title: 'Мои билеты',
            onTapBack: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: BlocBuilder<TicketsCubit, TicketsState>(
              builder: (context, state) {
                if (state.screenStatus == ScreenStatus.loading) {
                  return Container(
                    child: Center(
                      child: LoaderWidget(),
                    ),
                  );
                }
                return CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 18),
                      sliver: SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            'Активные',
                            style: TextStylesApp.drukTextCyr500(42),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            ...state.tickets
                                .map((e) => TicketItemWidget(
                                      ticket: e,
                                      topic: state.topics.firstWhere((element) => element.id == e.event.topicId),
                                      isHistory: false,
                                      calendar: deviceCalendarPlugin,
                                    ))
                                .toList(),
                          ],
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.only(left: 16, right: 4, top: 18, bottom: 18),
                      sliver: SliverToBoxAdapter(
                        child: GestureDetector(
                          onTap: () {
                            BlocProvider.of<TicketsCubit>(context).tapHistory();
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'История',
                                  style: TextStylesApp.drukTextCyr500(42),
                                  textAlign: TextAlign.left,
                                ),
                                Icon(
                                  state.viewHistory ? AppIcons.caretUp : AppIcons.caretDown,
                                  size: 42,
                                  color: ColorsApp.iconLight,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (state.viewHistory)
                      SliverPadding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 18,
                        ),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              ...state.historyTickets
                                  .map((e) => TicketItemWidget(
                                        ticket: e,
                                        topic: state.topics.firstWhere((element) => element.id == e.event.topicId),
                                        isHistory: true,
                                      ))
                                  .toList(),
                            ],
                          ),
                        ),
                      ),
                    SliverPadding(padding: EdgeInsets.only(bottom: 20)),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
