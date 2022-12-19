import 'package:faneron_mobile/src/common/controller/scrolls.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/screens/profile/profile.dart';
import 'package:faneron_mobile/src/core/presentation/widget/background/background_mount_body.dart';
import 'package:faneron_mobile/src/core/presentation/widget/button/button.dart';
import 'package:faneron_mobile/src/core/presentation/widget/element/interest_element.dart';
import 'package:faneron_mobile/src/core/presentation/widget/image/profile.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePageBody extends StatelessWidget {
  ProfilePageBody({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
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
                    image: state.user?.photo,
                    size: 230,
                    margin: EdgeInsets.only(bottom: 10),
                    darkBorder: true,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    alignment: Alignment.center,
                    child: Text(
                      '${state.user!.firstName} ${state.user!.surName}',
                      textAlign: TextAlign.center,
                      style: TextStylesApp.drukTextCyr500(
                        36,
                        lineHeight: 1.17,
                        color: ColorsApp.textDark,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      state.user!.email,
                      textAlign: TextAlign.center,
                      style: TextStylesApp.pragmatica400(
                        20,
                        lineHeight: 1.35,
                        color: ColorsApp.textDark.withOpacity(0.6),
                      ),
                    ),
                  ),
                  ButtonWidget(
                    title: 'Мои билеты',
                    onTap: () {
                      BlocProvider.of<RouterCubit>(context).onRouteToTickets();
                    },
                    height: 80,
                    fontSize: 32,
                    margin: EdgeInsets.symmetric(vertical: 28),
                  ),
                  Text(
                    'Мои интересы',
                    style: TextStylesApp.drukTextCyr500(
                      32,
                      color: ColorsApp.textDark,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: 11,
              right: 11,
              top: 22,
              bottom: 16,
            ),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    children: [
                      ProfileInterestElement(
                        title: 'Музыка',
                        isActive: state.interestProfile.music,
                        onTap: () {
                          BlocProvider.of<ProfileCubit>(context)
                              .onUpdateInterest(state.interestProfile.copyWith(music: !state.interestProfile.music));
                        },
                      ),
                      ProfileInterestElement(
                        title: 'Комиксы',
                        isActive: state.interestProfile.comics,
                        onTap: () {
                          BlocProvider.of<ProfileCubit>(context)
                              .onUpdateInterest(state.interestProfile.copyWith(comics: !state.interestProfile.comics));
                        },
                      ),
                      ProfileInterestElement(
                        title: 'Рисование',
                        isActive: state.interestProfile.painting,
                        onTap: () {
                          BlocProvider.of<ProfileCubit>(context).onUpdateInterest(
                              state.interestProfile.copyWith(painting: !state.interestProfile.painting));
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ProfileInterestElement(
                        title: 'Игры',
                        isActive: state.interestProfile.games,
                        onTap: () {
                          BlocProvider.of<ProfileCubit>(context)
                              .onUpdateInterest(state.interestProfile.copyWith(games: !state.interestProfile.games));
                        },
                      ),
                      ProfileInterestElement(
                        title: 'Книги',
                        isActive: state.interestProfile.books,
                        onTap: () {
                          BlocProvider.of<ProfileCubit>(context)
                              .onUpdateInterest(state.interestProfile.copyWith(books: !state.interestProfile.books));
                        },
                      ),
                      ProfileInterestElement(
                        title: 'Технологии',
                        isActive: state.interestProfile.technologies,
                        onTap: () {
                          BlocProvider.of<ProfileCubit>(context).onUpdateInterest(
                              state.interestProfile.copyWith(technologies: !state.interestProfile.technologies));
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ProfileInterestElement(
                        title: 'Новые знания',
                        isActive: state.interestProfile.newKnowledge,
                        onTap: () {
                          BlocProvider.of<ProfileCubit>(context).onUpdateInterest(
                              state.interestProfile.copyWith(newKnowledge: !state.interestProfile.newKnowledge));
                        },
                      ),
                      ProfileInterestElement(
                        title: 'События города',
                        isActive: state.interestProfile.cityEvents,
                        onTap: () {
                          BlocProvider.of<ProfileCubit>(context).onUpdateInterest(
                              state.interestProfile.copyWith(cityEvents: !state.interestProfile.cityEvents));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: 11,
              right: 11,
              top: 0,
              bottom: 10,
            ),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  ButtonWidget(
                    title: 'Обратная связь',
                    onTap: () => context.read<ProfileCubit>().onFeedBackButtonPressed(),
                    height: 58,
                    fontSize: 20,
                    // margin: EdgeInsets.symmetric(vertical: 28),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
