import 'package:faneron_mobile/src/common/controller/scrolls.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/widget/background/background_mount_body.dart';
import 'package:faneron_mobile/src/core/presentation/widget/button/button.dart';
import 'package:faneron_mobile/src/core/presentation/widget/image/profile.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUnAuthPageBody extends StatelessWidget {
  ProfileUnAuthPageBody({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: Временная заглушка. Нужно будет изменить
    return BackgroundMountBodyScroll(
      stream: context.read<ScrollProvider>().profilePageBodyScrollOffset,
      controller: context.read<ScrollProvider>().profilePageBodyController,
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(
            top: 6,
            left: 16,
            right: 16,
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                ProfileImageWidget(
                  image: null,
                  size: 230,
                  margin: EdgeInsets.only(bottom: 10),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  alignment: Alignment.topCenter,
                  height: 75,
                  child: Text(
                    'Неизвестный\nпользователь'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStylesApp.drukTextCyr500(
                      24,
                      lineHeight: 1.1,
                      color: ColorsApp.textDark,
                    ),
                  ),
                ),
                ButtonWidget(
                  title: 'Войти',
                  onTap: () {
                    BlocProvider.of<RouterCubit>(context).onRouteToAuth(callback: () {
                      BlocProvider.of<RouterCubit>(context).onPop();
                    });
                  },
                  height: 80,
                  fontSize: 32,
                  margin: EdgeInsets.symmetric(vertical: 28),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
