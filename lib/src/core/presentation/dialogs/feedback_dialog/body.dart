import 'package:faneron_mobile/src/core/presentation/widget/button/button.dart';
import 'package:faneron_mobile/src/core/presentation/widget/clipper/dialog_clipper.dart';
import 'package:faneron_mobile/src/core/presentation/widget/toast/toast.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FeedBackDialog extends StatefulWidget {
  const FeedBackDialog({Key? key}) : super(key: key);

  @override
  State<FeedBackDialog> createState() => _FeedBackDialogState();
}

class _FeedBackDialogState extends State<FeedBackDialog> {
  late final TextEditingController _controller;

  get body => _controller.text;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ClipPath(
        clipper: DialogBorderClipper(),
        child: Container(
          width: 376,
          height: 320,
          padding: EdgeInsets.all(1),
          color: ColorsApp.borderDark,
          child: ClipPath(
            clipper: DialogBorderClipper(),
            child: Container(
              padding: EdgeInsets.all(5),
              color: ColorsApp.backgroundModal,
              child: ClipPath(
                clipper: DialogBorderClipper(),
                child: Container(
                  color: ColorsApp.borderDark,
                  padding: EdgeInsets.all(1),
                  child: ClipPath(
                    clipper: DialogBorderClipper(),
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 31,
                        bottom: 17.7,
                        right: 10,
                        left: 10,
                      ),
                      color: ColorsApp.backgroundModal,
                      child: Column(
                        children: [
                          Text(
                            "Обратная связь",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStylesApp.drukTextCyr500(
                              32,
                              color: ColorsApp.textBlack,
                            ),
                          ),
                          SizedBox(height: 26),
                          TextField(
                            controller: _controller,
                            maxLines: 4,
                            minLines: 4,
                            onChanged: (value) {},
                            onSubmitted: (value) {},
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorsApp.inputBackground,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(16),
                            ),
                            cursorColor: ColorsApp.inputText,
                            cursorHeight: 20,
                            style: TextStylesApp.pragmatica400(
                              18,
                              color: ColorsApp.inputText,
                              lineHeight: 1.2,
                            ),
                          ),
                          SizedBox(height: 19.3),
                          ButtonWidget(
                            title: "Отправить",
                            height: 58,
                            fontSize: 20,
                            onTap: () async {
                              try {
                                final success = await launchUrlString(
                                    "mailto:faneronspace@gmail.com?subject=Обратная связь&body=$body");
                                if (!success)
                                  showErrorToast(
                                      "У вас не установлено ни одного приложения для отправки электронных писем.\n"
                                      "Напишите нам faneronspace@gmail.com");
                              } catch (e) {
                                showErrorToast(
                                    "У вас не установлено ни одного приложения для отправки электронных писем.\n"
                                    "Напишите нам faneronspace@gmail.com");
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
