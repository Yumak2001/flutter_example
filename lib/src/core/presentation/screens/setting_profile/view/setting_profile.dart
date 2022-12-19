import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';
import 'package:faneron_mobile/src/core/presentation/screens/setting_profile/setting_profile.dart';
import 'package:faneron_mobile/src/core/presentation/widget/appBar/second_app_bar.dart';
import 'package:faneron_mobile/src/core/presentation/widget/element/loader.dart';
import 'package:faneron_mobile/src/resource/keys.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingProfilePage extends StatefulWidget {
  static const id = '/settingProfile';
  SettingProfilePage({
    required Key key,
  }) : super(key: key);

  @override
  _SettingProfilePageState createState() => _SettingProfilePageState();
}

class _SettingProfilePageState extends State<SettingProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: SettingProfilePageKeys.scaffold,
      backgroundColor: ColorsApp.backgroundMainPage,
      body: Column(
        children: [
          SecondAppBarWidget(
            keyPage: 'SettingProfilePage',
            title: 'Настройки профиля',
            onTapBack: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: BlocBuilder<SettingProfileCubit, SettingProfileState>(
              builder: (context, state) {
                if (state.screenStatus == ScreenStatus.loading) {
                  return Container(
                    child: Center(
                      child: LoaderWidget(),
                    ),
                  );
                }
                return SettingProfilePageBody(
                  key: SettingProfilePageKeys.body,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
