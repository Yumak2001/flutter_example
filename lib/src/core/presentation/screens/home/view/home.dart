import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:faneron_mobile/src/core/presentation/screens/ar/page.dart';
import 'package:faneron_mobile/src/core/presentation/screens/exposition/exposition.dart';
import 'package:faneron_mobile/src/core/presentation/screens/home/home.dart';
import 'package:faneron_mobile/src/core/presentation/screens/laboratory/laboratory.dart';
import 'package:faneron_mobile/src/core/presentation/screens/main/main.dart';
import 'package:faneron_mobile/src/core/presentation/screens/profile/profile.dart';
import 'package:faneron_mobile/src/resource/keys.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  static const id = '/home';
  HomePage({
    required Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: HomePageKeys.scaffold,
      backgroundColor: ColorsApp.backgroundMainPage,
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return IndexedStack(
                        index: state.currentHomePage.index,
                        children: [
                          MainPage(
                            key: MainPageKeys.page,
                          ),
                          LaboratoryPage(
                            key: LaboratoryPageKeys.page,
                          ),
                          ArTemp(),
                          ExpositionPage(key: ExpositionPageKeys.page),
                          ProfilePage(
                            key: ProfilePageKeys.page,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                BottomNavigationMenuWidget(
                  key: HomePageKeys.bottomNavMenu,
                ),
              ],
            ),
          ),
          Positioned.fill(
            top: ConstantsApp.appBarHeight(context),
            child: MenuWidget(),
          ),
        ],
      ),
    );
  }
}
