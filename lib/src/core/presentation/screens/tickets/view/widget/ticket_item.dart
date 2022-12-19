import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:faneron_mobile/src/core/domain/entities/events.dart';
import 'package:faneron_mobile/src/core/domain/entities/tickets.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/widget/clipper/ticket_item.dart';
import 'package:faneron_mobile/src/extension/date_time.dart';
import 'package:faneron_mobile/src/resource/icons.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timezone/timezone.dart' as tz;

class TicketItemWidget extends StatelessWidget {
  final TicketDomain ticket;
  final TopicDomain topic;
  final bool isHistory;
  late final Color backgroundColor;
  final DeviceCalendarPlugin? calendar;
  TicketItemWidget({
    required this.ticket,
    required this.topic,
    required this.isHistory,
    this.calendar,
  }) {
    backgroundColor = (isHistory) ? ColorsApp.backgroundTicketHistory : ColorsApp.backgroundTicketFree;
  }

  List<Calendar> _calendars = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 6, right: 6, top: 10, bottom: 10),
      height: 650,
      child: ClipPath(
        clipper: TicketItemClipper(false, radius: 57 / 2, offset: 28.5),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset(
                AppPicture.ticketBackground,
                height: 300,
              ).image,
              repeat: ImageRepeat.repeat,
              opacity: isHistory
                  ? 0.2
                  : ticket.isFree
                      ? 0.5
                      : 0.3,
              colorFilter: ticket.isFree || isHistory ? ColorFilter.mode(backgroundColor, BlendMode.overlay) : null,
            ),
            gradient: (ticket.isFree || isHistory) ? null : ColorsApp.gradientBackground,
          ),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: ClipPath(
            clipper: TicketItemClipper(true, radius: 45, offset: 29),
            child: Container(
              color: ColorsApp.borderDark,
              padding: EdgeInsets.all(2),
              child: ClipPath(
                clipper: TicketItemClipper(true, radius: 49, offset: 29),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset(
                        AppPicture.ticketBackground,
                        height: 300,
                      ).image,
                      repeat: ImageRepeat.repeat,
                      opacity: isHistory
                          ? 0.2
                          : ticket.isFree
                              ? 0.5
                              : 0.3,
                      colorFilter:
                          ticket.isFree || isHistory ? ColorFilter.mode(backgroundColor, BlendMode.overlay) : null,
                    ),
                    gradient: (ticket.isFree || isHistory) ? null : ColorsApp.gradientBackground,
                  ),
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 15, bottom: 24),
                          padding: EdgeInsets.all(21),
                          width: 210,
                          height: 210,
                          decoration: BoxDecoration(
                            color: ColorsApp.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: ticket.urlQrCode,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        margin: EdgeInsets.symmetric(vertical: 14),
                        color: ColorsApp.backgroundItemActive,
                        child: Container(
                          child: Text(
                            topic.title.toUpperCase(),
                            style: TextStylesApp.drukTextCyr500(
                              20,
                              color: ColorsApp.textBlack,
                              lineHeight: 1.1,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        DateTimeToString.eventStartFinishTime(ticket.event.startEvent, ticket.event.finishEvent),
                        style: TextStylesApp.pragmatica400(
                          20,
                          color: isHistory ? ColorsApp.text : ColorsApp.textBlack,
                          lineHeight: 1.35,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 7, bottom: 20),
                        height: 76,
                        child: Text(
                          ticket.event.title.toUpperCase(),
                          maxLines: 3,
                          style: TextStylesApp.drukTextCyr500(
                            24,
                            color: isHistory ? ColorsApp.text : ColorsApp.textBlack,
                            lineHeight: 1.1,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                AppIcons.location,
                                size: 20,
                                color: isHistory ? ColorsApp.iconLight : ColorsApp.iconDark,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Павильон «Космос»',
                                style: TextStylesApp.pragmatica400(
                                  20,
                                  color: isHistory ? ColorsApp.text : ColorsApp.textBlack,
                                  lineHeight: 1.35,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              if (!isHistory) {
                                BlocProvider.of<RouterCubit>(context).onRouteToNavigation();
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 28),
                              child: RichText(
                                text: TextSpan(
                                  text: '(',
                                  children: [
                                    TextSpan(
                                      text: 'как добраться?',
                                      style: TextStylesApp.pragmatica400(
                                        20,
                                        color: (isHistory ? ColorsApp.text : ColorsApp.textBlack).withOpacity(0.54),
                                        lineHeight: 1.35,
                                      ).copyWith(
                                        decoration: isHistory ? TextDecoration.none : TextDecoration.underline,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ')',
                                    ),
                                  ],
                                  style: TextStylesApp.pragmatica400(
                                    20,
                                    color: (isHistory ? ColorsApp.text : ColorsApp.textBlack).withOpacity(0.54),
                                    lineHeight: 1.35,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            AppIcons.calendar,
                            size: 20,
                            color: isHistory ? ColorsApp.iconLight : ColorsApp.iconDark,
                          ),
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              if (!isHistory) {
                                addToCalendar();
                              }
                            },
                            child: Text(
                              'Добавить в календарь',
                              style: TextStylesApp.pragmatica400(
                                20,
                                color: isHistory ? ColorsApp.text.withOpacity(0.54) : ColorsApp.textBlack,
                                lineHeight: 1.35,
                              ).copyWith(
                                decoration: isHistory ? TextDecoration.none : TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addToCalendar() async {
    await _retrieveCalendars();
    String? calId;
    if (!_calendars.any((element) => (element.name ?? '').contains('Фанерон'))) {
      var cal = await calendar!.createCalendar('Фанерон', calendarColor: ColorsApp.textAccent);
      if (cal.isSuccess) {
        calId = cal.data;
      }
    } else {
      calId = _calendars.firstWhere((element) => (element.name ?? '').contains('Фанерон')).id;
    }
    var data = await calendar!.createOrUpdateEvent(Event(
      calId,
      title: ticket.event.title,
      start: dateTimeToTZ(ticket.event.startEvent.add(Duration(hours: -3))),
      end: dateTimeToTZ(ticket.event.finishEvent.add(Duration(hours: -3))),
      location: 'Павильон «Космос»',
      description: topic.title,
    ));
    if (data != null && data.isSuccess) {
      Fluttertoast.showToast(
        msg: 'Мероприятие добавлено в календарь.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: ColorsApp.backgroundMainPage.withOpacity(0.54),
        textColor: ColorsApp.text,
        fontSize: 18.0,
      );
    }
  }

  tz.TZDateTime dateTimeToTZ(DateTime date) {
    return tz.TZDateTime.utc(
      date.year,
      date.month,
      date.day,
      date.hour,
      date.minute,
      date.second,
    );
  }

  Future _retrieveCalendars() async {
    //Retrieve user's calendars from mobile device
    //Request permissions first if they haven't been granted
    try {
      var permissionsGranted = await calendar!.hasPermissions();
      if (permissionsGranted.isSuccess && !(permissionsGranted.data ?? false)) {
        permissionsGranted = await calendar!.requestPermissions();
        if (!permissionsGranted.isSuccess || !(permissionsGranted.data ?? false)) {
          return;
        }
      }

      final calendarsResult = await calendar!.retrieveCalendars();
      _calendars = calendarsResult.data!.toList();
    } catch (e) {
      print(e);
    }
  }
}
