import 'package:faneron_mobile/src/common/controller/focus_text_field.dart';
import 'package:faneron_mobile/src/common/controller/text_field_controllers.dart';
import 'package:faneron_mobile/src/core/presentation/screens/laboratory/laboratory.dart';
import 'package:faneron_mobile/src/core/presentation/widget/input/search_input.dart';
import 'package:faneron_mobile/src/resource/keys.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaboratoryEventHeaderWidget extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return BlocBuilder<LaboratoryCubit, LaboratoryState>(builder: (context, state) {
      return Container(
        decoration: BoxDecoration(
          color: ColorsApp.backgroundLaboratoryPage,
          boxShadow: [
            if (shrinkOffset > 0.0)
              BoxShadow(
                color: ColorsApp.black.withOpacity(0.6),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SearchInputWidget(
              key: LaboratoryPageKeys.bodySearchInput,
              margin: EdgeInsets.all(16),
              focus: context.read<FocusTextFieldProvider>().laboratorySearch,
              controller: context.read<TextFieldControllers>().laboratorySearch,
              onChange: (String text) {
                BlocProvider.of<LaboratoryCubit>(context).onChangeSearch(text);
              },
            ),
            Container(
              height: 36,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 10, right: 10),
                itemBuilder: (context, index) {
                  return LaboratoryTagListItemWidget(
                    title: state.tagList[index].title,
                    active: state.tagActiveIndex == index,
                    onTap: () {
                      context.read<FocusTextFieldProvider>().unFocusAll();
                      BlocProvider.of<LaboratoryCubit>(context).onTapTagItem(index);
                    },
                  );
                },
                itemCount: state.tagList.length,
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(top: 24, bottom: 16),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16, right: 16),
                itemBuilder: (context, index) {
                  return LaboratoryDateListItemWidget(
                    date: state.dateList[index],
                    active: state.dateActiveIndex == index,
                    hide: state.dateHideList.where((element) => element == state.dateList[index]).length > 0,
                    onTap: () {
                      context.read<FocusTextFieldProvider>().unFocusAll();
                      BlocProvider.of<LaboratoryCubit>(context).onTapDateItem(index);
                    },
                  );
                },
                itemCount: state.dateList.length,
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  double get maxExtent => 208;

  @override
  double get minExtent => 208;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
