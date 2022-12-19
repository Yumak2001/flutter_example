import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';
import 'package:faneron_mobile/src/resource/icons.dart';
import 'package:flutter/cupertino.dart';

extension HomeScreensExtension on HomeScreens {
  IconData get toIcon {
    switch (this) {
      case HomeScreens.main:
        return AppIcons.home;
      case HomeScreens.laboratory:
        return AppIcons.flask;
      case HomeScreens.ar:
        return AppIcons.expand;
      case HomeScreens.mapLocation:
        return AppIcons.mapLocation;
      case HomeScreens.profile:
        return AppIcons.user;
    }
  }
}
