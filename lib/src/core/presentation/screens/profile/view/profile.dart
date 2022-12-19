import 'package:faneron_mobile/src/core/presentation/screens/profile/profile.dart';
import 'package:faneron_mobile/src/core/presentation/widget/appBar/profile_app_bar.dart';
import 'package:faneron_mobile/src/resource/keys.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.backgroundMainPage,
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Column(
            children: [
              ProfileAppBarWidget(
                keyPage: 'ProfilePage',
                isAuth: state.isAuth,
              ),
              Expanded(
                child: state.isAuth
                    ? (state.user != null)
                        ? ProfilePageBody(
                            key: ProfilePageKeys.body,
                          )
                        : ProfileLoadPageBody(
                            key: ProfilePageKeys.body,
                          )
                    : ProfileUnAuthPageBody(
                        key: ProfilePageKeys.body,
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
