import 'package:faneron_mobile/src/core/presentation/screens/main/main.dart';
import 'package:faneron_mobile/src/core/presentation/widget/appBar/main_app_bar.dart';
import 'package:faneron_mobile/src/resource/keys.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  MainPage({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.backgroundMainPage,
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return Column(
            children: [
              MainAppBarWidget(
                keyPage: 'MainPage',
                showButtonPay: true,
              ),
              Expanded(
                child: Stack(
                  children: [
                    MainPageBody(
                      key: MainPageKeys.body,
                    ),
                    // MainButtonPay(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
