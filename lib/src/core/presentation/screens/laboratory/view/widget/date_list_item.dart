import 'package:faneron_mobile/src/core/presentation/widget/clipper/button_border.dart';
import 'package:faneron_mobile/src/core/presentation/widget/clipper/laboratory_list_items.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LaboratoryDateListItemWidget extends StatelessWidget {
  final DateTime? date;
  final bool active;
  final bool hide;
  final Function() onTap;

  LaboratoryDateListItemWidget({
    required this.date,
    required this.active,
    required this.onTap,
    required this.hide,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 97,
      child: GestureDetector(
        onTap: () => (!hide) ? onTap.call() : null,
        child: ClipPath(
          clipper: LaboratoryDateListClip(),
          child: Container(
            padding: EdgeInsets.all(5),
            height: 50,
            color: (!hide)
                ? (active)
                    ? ColorsApp.backgroundItem
                    : ColorsApp.backgroundItemLight
                : ColorsApp.backgroundItemInActive,
            child: ClipPath(
              clipper: ButtonBorderClipper(),
              child: Container(
                decoration: BoxDecoration(
                  color: (!hide)
                      ? (!active)
                          ? ColorsApp.backgroundItem
                          : ColorsApp.backgroundItemLight
                      : ColorsApp.black.withOpacity(0.5),
                ),
                padding: EdgeInsets.all(1),
                child: ClipPath(
                  clipper: ButtonBorderClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: (!hide)
                          ? (active)
                              ? ColorsApp.backgroundItem
                              : ColorsApp.backgroundItemLight
                          : ColorsApp.backgroundItemInActive,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      (date == null)
                          ? 'Все'
                          : DateFormat('dd MMM', 'ru_RU').format(date!),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStylesApp.pragmatica400(
                        18,
                        lineHeight: 1.35,
                        color: hide
                            ? ColorsApp.black.withOpacity(0.5)
                            : (active)
                                ? ColorsApp.textWhite
                                : ColorsApp.textBlack,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
