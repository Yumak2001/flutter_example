import 'package:faneron_mobile/src/common/controller/scrolls.dart';
import 'package:faneron_mobile/src/core/presentation/screens/laboratory/laboratory.dart';
import 'package:faneron_mobile/src/core/presentation/widget/appBar/main_app_bar.dart';
import 'package:faneron_mobile/src/resource/keys.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaboratoryPage extends StatelessWidget {
  LaboratoryPage({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.backgroundMainPage,
      child: BlocBuilder<LaboratoryCubit, LaboratoryState>(
        builder: (context, state) {
          return Column(
            children: [
              MainAppBarWidget(
                keyPage: 'LaboratoryPage',
                title: 'Лаборатория',
                titleShowScroll: true,
                extentTitleStartShowScroll: 45,
                scrollOffsetStream: context.read<ScrollProvider>().laboratoryPageBodyScrollOffset,
              ),
              Expanded(
                child: LaboratoryPageBody(
                  key: LaboratoryPageKeys.body,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
