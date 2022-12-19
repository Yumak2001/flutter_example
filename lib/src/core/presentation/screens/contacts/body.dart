import 'dart:io';

import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/screens/contacts/cubit.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactsPageBody extends StatelessWidget {
  const ContactsPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsCubit, ContactsState>(
      builder: (BuildContext context, state) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20,
            bottom: ConstantsApp.bottomViewPadding(context) + 20,
            left: 16,
            right: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11.5),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "вднх, павильон «Космос»".toUpperCase(),
                      style: TextStylesApp.drukTextCyr500(
                        40,
                        lineHeight: 1.05,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 50),
                    GestureDetector(
                      onTap: () => launchUrlString("tel:+79657503000"),
                      child: Text(
                        "+7(965)750-30-00",
                        style: TextStylesApp.pragmatica400(
                          20,
                          lineHeight: 1.35,
                          color: ColorsApp.textAccent,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Связь: ",
                          style: TextStylesApp.pragmatica400(
                            20,
                            lineHeight: 1.35,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launchUrlString("mailto:hello@faneron.ru");
                          },
                          child: Text(
                            "hello@faneron.ru",
                            style: TextStylesApp.pragmatica400(
                              20,
                              lineHeight: 1.35,
                              color: ColorsApp.textAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<RouterCubit>(context).onRouteToWebView(
                          url: 'https://faneron.ru/templates/faneron22/files/f-agreement.pdf',
                          title: 'Политика конфиденциальности',
                        );
                      },
                      child: Text(
                        "Политика конфиденциальности",
                        style: TextStylesApp.pragmatica400(
                          20,
                          lineHeight: 1.35,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Публичная оферта",
                      style: TextStylesApp.pragmatica400(
                        20,
                        lineHeight: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    AppPicture.authBottomLogo,
                    fit: BoxFit.fitWidth,
                    color: Colors.white,
                  ),
                  SizedBox(height: 43),
                  Text(
                    "© 2022, Москонцерт × Агентство Параллель",
                    style: TextStylesApp.pragmatica400(
                      16,
                      lineHeight: 1.35,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
