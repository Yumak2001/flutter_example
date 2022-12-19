import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/core/domain/entities/events.dart';
import 'package:faneron_mobile/src/core/presentation/widget/background/background_modal.dart';
import 'package:faneron_mobile/src/extension/date_time.dart';
import 'package:faneron_mobile/src/resource/icons.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuccessPayTicketModal extends StatefulWidget {
  static String id = '/successPayTicketModal';
  final EventDomain eventSuccessPay;
  SuccessPayTicketModal(this.eventSuccessPay);

  @override
  _SuccessPayTicketModalState createState() => _SuccessPayTicketModalState();
}

class _SuccessPayTicketModalState extends State<SuccessPayTicketModal> {
  @override
  Widget build(BuildContext context) {
    Log.info('id: ${widget.eventSuccessPay.id}');
    return BackgroundModalWidget(
      child: Container(
        padding: EdgeInsets.all(11),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Регистрация\nпрошла успешно',
                textAlign: TextAlign.center,
                style: TextStylesApp.bebus700(
                  40,
                  color: ColorsApp.textBlack,
                ),
              ),
            ),
            Text(
              'Приобретенные билеты будут храниться в вашем личном кабинете. Просто Предъявите qr-код при\nвходе на площадку.',
              textAlign: TextAlign.center,
              style: TextStylesApp.pragmatica400(
                16,
                color: ColorsApp.textBlack,
                lineHeight: 1.2,
              ),
            ),
            Container(
              height: 124,
              margin: EdgeInsets.symmetric(vertical: 22),
              child: Text(
                widget.eventSuccessPay.title,
                maxLines: 4,
                textAlign: TextAlign.center,
                style: TextStylesApp.drukTextCyr500(
                  28,
                  color: ColorsApp.textBlack,
                  lineHeight: 1.1,
                ),
              ),
            ),
            Container(
              height: 132,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        AppIcons.calendar,
                        color: ColorsApp.iconDark,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        DateTimeToString.eventDateToString(widget.eventSuccessPay.startEvent),
                        style: TextStylesApp.pragmatica400(
                          20,
                          color: ColorsApp.textBlack,
                          lineHeight: 1.35,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        AppIcons.clock,
                        color: ColorsApp.iconDark,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        DateTimeToString.eventTimeToString(
                            widget.eventSuccessPay.startEvent, widget.eventSuccessPay.finishEvent),
                        style: TextStylesApp.pragmatica400(
                          20,
                          color: ColorsApp.textBlack,
                          lineHeight: 1.35,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 27),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        AppIcons.mapLocation,
                        color: ColorsApp.iconDark,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'ВДНХ, павильон «Космос»',
                        style: TextStylesApp.pragmatica400(
                          20,
                          color: ColorsApp.textBlack,
                          lineHeight: 1.35,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
