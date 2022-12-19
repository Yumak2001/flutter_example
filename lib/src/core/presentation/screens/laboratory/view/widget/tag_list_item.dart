import 'package:faneron_mobile/src/core/presentation/widget/clipper/laboratory_list_items.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';

class LaboratoryTagListItemWidget extends StatelessWidget {
  final String title;
  final bool active;
  final Function() onTap;

  LaboratoryTagListItemWidget({
    required this.title,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 6, right: 6),
      child: GestureDetector(
        onTap: () => onTap.call(),
        child: ClipPath(
          clipper: LaboratoryTagListClip(),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            height: 36,
            alignment: Alignment.center,
            color: (active)
                ? ColorsApp.backgroundItemActive
                : ColorsApp.backgroundItem,
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStylesApp.pragmatica400(18, lineHeight: 1.35),
            ),
          ),
        ),
      ),
    );
  }
}
