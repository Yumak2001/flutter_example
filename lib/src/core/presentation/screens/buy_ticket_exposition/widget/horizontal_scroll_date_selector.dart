import 'package:faneron_mobile/src/core/presentation/screens/buy_ticket_exposition/cubit.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'calendar_item.dart';
import 'date_item.dart';

class HorizontalScrollDateSelector extends StatefulWidget {
  final List<DateTime> dates;
  final int selectedDateIndex;

  HorizontalScrollDateSelector({
    Key? key,
    required this.dates,
    required this.selectedDateIndex,
  }) : super(key: key);

  @override
  State<HorizontalScrollDateSelector> createState() => _HorizontalScrollDateSelectorState();
}

class _HorizontalScrollDateSelectorState extends State<HorizontalScrollDateSelector> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  separatedBuilder() {}

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Duration(milliseconds: 300),
      child: isExpanded
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(border: Border.all(width: 0.5)),
                  child: Wrap(
                      children: widget.dates
                          .asMap()
                          .entries
                          .map<Widget>((e) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isExpanded = false;
                                  });
                                  context.read<BuyTicketExpositionCubit>().setSelectedDate(e.key);
                                },
                                child: DateItem(
                                  isSelected: e.key == widget.selectedDateIndex,
                                  date: e.value,
                                ),
                              ))
                          .toList()),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: onCalendarTap,
                  child: SvgPicture.asset(
                    AppPicture.caretDown,
                    width: 15,
                    color: ColorsApp.iconDark,
                  ),
                )
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                      color: ColorsApp.borderDark,
                      border: Border(
                        top: BorderSide(color: ColorsApp.borderDark, width: 0.40),
                        bottom: BorderSide(color: ColorsApp.borderDark, width: 0.40),
                        left: BorderSide(color: ColorsApp.borderDark, width: 0.5),
                      ),
                    ),
                    child: ListView.builder(
                      controller: ScrollController(initialScrollOffset: widget.selectedDateIndex * 70),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => context.read<BuyTicketExpositionCubit>().setSelectedDate(index),
                          child: DateItem(
                            isSelected: index == widget.selectedDateIndex,
                            date: widget.dates[index],
                          ),
                        );
                      },
                      itemCount: widget.dates.length,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onCalendarTap,
                  child: CalendarButton(),
                )
              ],
            ),
    );
  }

  onCalendarTap() => setState(() {
        isExpanded = !isExpanded;
      });
}
