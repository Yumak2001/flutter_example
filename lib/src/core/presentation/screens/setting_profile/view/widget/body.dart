import 'package:faneron_mobile/src/common/controller/focus_text_field.dart';
import 'package:faneron_mobile/src/common/controller/scrolls.dart';
import 'package:faneron_mobile/src/common/controller/text_field_controllers.dart';
import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:faneron_mobile/src/core/presentation/entities/input.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/screens/setting_profile/setting_profile.dart';
import 'package:faneron_mobile/src/core/presentation/widget/button/button.dart';
import 'package:faneron_mobile/src/core/presentation/widget/image/profile.dart';
import 'package:faneron_mobile/src/core/presentation/widget/input/profile_edit.dart';
import 'package:faneron_mobile/src/resource/keys.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingProfilePageBody extends StatelessWidget {
  SettingProfilePageBody({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingProfileCubit, SettingProfileState>(
      builder: (context, state) {
        return CustomScrollView(
          key: SettingProfilePageKeys.bodyScrollList,
          controller: context.read<ScrollProvider>().settingProfilePageBodyController,
          slivers: [
            SliverPadding(
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 8, bottom: ConstantsApp.bottomViewPadding(context) + 2),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Основная информация',
                        style: TextStylesApp.drukTextCyr500(32),
                      ),
                    ),
                    itemTitle('Фото профиля'),
                    ProfileImageWidget(
                      image: state.profile!.photo,
                      size: 230,
                      borderColor: ColorsApp.borderImage,
                      margin: EdgeInsets.only(top: 12, bottom: 12),
                    ),
                    ButtonWidget(
                      title: 'Загрузить фото',
                      height: 58,
                      loading: state.loadingUploadImage,
                      onTap: () {
                        BlocProvider.of<RouterCubit>(context).onRouteToUploadImageModal((String path) {
                          BlocProvider.of<RouterCubit>(context).onRouteToImagePicker(path);
                        });
                      },
                      margin: EdgeInsets.only(top: 18, bottom: 22),
                    ),
                    itemTitle('Или выберите персонажа'),
                    Container(
                      margin: EdgeInsets.only(top: 8, bottom: 18),
                      child: GridView.count(
                        crossAxisCount: 3,
                        children: generateImages(context, active: state.activeProfile),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    ProfileEditInputWidget(
                      initData: state.profile?.firstName,
                      hint: 'Имя',
                      focus: context.read<FocusTextFieldProvider>().profileSettingFirstName,
                      controller: context.read<TextFieldControllers>().profileSettingFirstName,
                      onChange: (value) {
                        BlocProvider.of<SettingProfileCubit>(context).onChangeEditing(
                          firstName: value,
                        );
                      },
                    ),
                    ProfileEditInputWidget(
                      initData: state.profile?.surName,
                      hint: 'Фамилия',
                      focus: context.read<FocusTextFieldProvider>().profileSettingSurName,
                      controller: context.read<TextFieldControllers>().profileSettingSurName,
                      onChange: (value) {
                        BlocProvider.of<SettingProfileCubit>(context).onChangeEditing(
                          surName: value,
                        );
                      },
                    ),
                    ProfileEditInputWidget(
                      initData: state.profile?.city,
                      hint: 'Город',
                      focus: context.read<FocusTextFieldProvider>().profileSettingCity,
                      controller: context.read<TextFieldControllers>().profileSettingCity,
                      onChange: (value) {
                        BlocProvider.of<SettingProfileCubit>(context).onChangeEditing(
                          city: value,
                        );
                      },
                    ),
                    ProfileEditInputWidget(
                      initData: state.profile?.age,
                      hint: 'Возраст',
                      inputType: InputType.number,
                      focus: context.read<FocusTextFieldProvider>().profileSettingAge,
                      controller: context.read<TextFieldControllers>().profileSettingAge,
                      onChange: (value) {
                        BlocProvider.of<SettingProfileCubit>(context).onChangeEditing(
                          age: value,
                        );
                      },
                    ),
                    ButtonWidget(
                      title: 'Сохранить',
                      height: 58,
                      loading: state.loadingSaveData,
                      active: ((state.firstNameEdit != state.profile!.firstName ||
                              state.surNameEdit != state.profile!.surName ||
                              state.cityEdit != state.profile!.city ||
                              state.ageEdit != state.profile!.age) &&
                          (state.firstNameEdit != null &&
                              state.firstNameEdit != '' &&
                              state.surNameEdit != null &&
                              state.surNameEdit != '')),
                      onTap: () {
                        context.read<FocusTextFieldProvider>().unFocusProfileSetting();
                        BlocProvider.of<SettingProfileCubit>(context).onTapSave();
                      },
                      margin: EdgeInsets.symmetric(vertical: 12),
                    ),
                    Text(
                      'Данные для входа',
                      style: TextStylesApp.drukTextCyr500(32),
                    ),
                    ProfileEditInputWidget(
                      initData: state.profile?.email,
                      editing: false,
                      hint: 'Адрес электронной почты',
                    ),
                    ButtonWidget(
                      title: 'Изменить пароль',
                      height: 58,
                      onTap: () {
                        BlocProvider.of<RouterCubit>(context).onRouteToEditPass();
                      },
                      margin: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget itemTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStylesApp.pragmatica400(
          18,
          lineHeight: 1.35,
          color: ColorsApp.text.withOpacity(0.4),
        ),
      ),
    );
  }

  List<Widget> generateImages(BuildContext context, {required int active}) {
    List<Widget> result = [];
    for (var i = 1; i < 7; i++) {
      result.add(
        ProfileSettingSmallImage(
          image: AppPicture.profile(i),
          onTap: (String path) {
            BlocProvider.of<SettingProfileCubit>(context).onTapProfileImage(
              path: path,
              id: i,
            );
          },
          isActive: (active == i),
        ),
      );
    }
    return result;
  }
}
