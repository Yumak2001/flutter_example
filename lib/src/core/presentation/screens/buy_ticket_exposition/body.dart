import 'package:faneron_mobile/src/core/presentation/screens/buy_ticket_exposition/widget/horizontal_scroll_date_selector.dart';
import 'package:faneron_mobile/src/core/presentation/widget/toast/toast.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'cubit.dart';
import 'widget/buy_ticket_card.dart';

class BuyTicketExpositionPageBody extends StatelessWidget {
  const BuyTicketExpositionPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BuyTicketExpositionCubit, BuyTicketState>(
      listener: (_, state) {
        if (state.isTicketBuyUrlIsSuccess == true) {
          launchUrlString(state.ticketBuyUrl);
        }
        if (state.isTicketBuyUrlIsSuccess == false) {
          showErrorToast("Не удалось получить билет на эту дату");
        }
      },
      builder: (BuildContext context, state) {
        return Container(
          color: ColorsApp.backgroundBuyTicketExposition,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 16),
            child: Column(
              children: [
                Text("Экcпозиция", style: TextStylesApp.bebus700(48, color: ColorsApp.textDark)),
                SizedBox(height: 2),
                Text(
                  "Покупаешь билет на экспозицию? Приходи в лабораторию Фанерона в этот же день без регистрации.",
                  style: TextStylesApp.pragmatica400(18, lineHeight: 1.35, color: ColorsApp.textDark),
                ),
                SizedBox(height: 24),
                Text("Выберите дату".toUpperCase(), style: TextStylesApp.drukTextCyr500(24, color: ColorsApp.textDark)),
                SizedBox(height: 16),
                HorizontalScrollDateSelector(
                  dates: state.dates!,
                  selectedDateIndex: state.selectedDateIndex,
                ),
                SizedBox(height: 24),
                BuyTicketCard(
                  selectedDate: state.dates![state.selectedDateIndex],
                ),
                SizedBox(height: 20),
                Text(
                  'ПРИОБРЕТЕННЫЕ БИЛЕТЫ БУДУТ ХРАНИТЬСЯ В ВАШЕМ ЛИЧНОМ КАБИНЕТЕ. ПРОСТО ПРЕДЪЯВИТЕ QR-КОД ПРИ ВХОДЕ НА ПЛОЩАДКУ.',
                  style: TextStylesApp.drukTextCyr500(16, lineHeight: 1.25, color: ColorsApp.textDark),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Хочешь приобрести билет на площадке? Билеты продаются в кассе павильона «Космос», которая '
                  'находится у главного входа. Обрати внимание, что в кассах продаются только комбо-билеты за '
                  '800 р. В них входит посещение экспозиции Фанерона и основной экспозиции центра «Космонавтика '
                  'и авиация».',
                  style: TextStylesApp.pragmatica400(16, lineHeight: 1.25, color: ColorsApp.textDark),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
