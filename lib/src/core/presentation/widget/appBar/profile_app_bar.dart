import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/screens/profile/profile.dart';
import 'package:faneron_mobile/src/resource/icons.dart';
import 'package:faneron_mobile/src/resource/keys.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileAppBarWidget extends StatelessWidget {
  final String keyPage;
  final bool isAuth;

  ProfileAppBarWidget({
    required this.keyPage,
    required this.isAuth,
  }) : super(key: HomePageKeys.appBar(keyPage));

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ConstantsApp.topViewPadding(context),
      ),
      height: ConstantsApp.appBarHeight(),
      width: double.infinity,
      color: ColorsApp.appBarBackground,
      child: Stack(
        children: [
          if (isAuth)
            Positioned(
              top: 4,
              left: 6,
              child: GestureDetector(
                key: HomePageKeys.appBarMenuButton(keyPage),
                onTap: () {
                  BlocProvider.of<ProfileCubit>(context).onTapLogOut();
                },
                child: Container(
                  key: HomePageKeys.appBarMenu(keyPage),
                  height: ConstantsApp.appBarIconMenuContainerSize,
                  width: ConstantsApp.appBarIconMenuContainerSize,
                  color: Colors.transparent,
                  child: Icon(
                    AppIcons.logout,
                    color: ColorsApp.appBarIconColor,
                    size: 42,
                  ),
                ),
              ),
            ),
          if (isAuth)
            Positioned(
              top: 10,
              right: 16.5,
              child: GestureDetector(
                key: HomePageKeys.appBarMenuButton(keyPage),
                onTap: () {
                  BlocProvider.of<RouterCubit>(context).onRouteToSettingProfile();
                },
                child: Container(
                  key: HomePageKeys.appBarMenu(keyPage),
                  height: ConstantsApp.appBarIconMenuContainerSize,
                  width: ConstantsApp.appBarIconMenuContainerSize,
                  color: Colors.transparent,
                  child: Icon(
                    AppIcons.settingAlt,
                    color: ColorsApp.appBarIconColor,
                    size: 30,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
