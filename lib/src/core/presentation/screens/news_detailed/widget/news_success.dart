import 'package:faneron_mobile/src/core/domain/entities/news_detailed.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NewsWidget extends StatelessWidget {
  final NewsDetailed news;

  const NewsWidget({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          news.title.toUpperCase(),
          style: TextStylesApp.drukCyr500(48),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30),
        Divider(height: 1, thickness: 1, color: Colors.white),
        SizedBox(height: 17),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat("dd.MM.yy").format(news.createdAt),
              style: TextStylesApp.pragmatica400(18, lineHeight: 1.35),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () => launchUrlString(
                    "https://vk.com/share.php?url=https://faneron.ru/news/${news.slug}",
                    mode: LaunchMode.externalApplication,
                  ),
                  child: Container(
                    child: SvgPicture.asset(
                      AppPicture.vkIcon,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                GestureDetector(
                  onTap: () => launchUrlString(
                      "tg://msg_url?url=https://faneron.ru/news/${news.slug}&text=${news.title}",
                      mode: LaunchMode.externalApplication),
                  child: SvgPicture.asset(
                    AppPicture.telegramIcon,
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 17),
        Divider(height: 1, thickness: 1, color: Colors.white),
        SizedBox(height: 30),
        html.Html(
          data: '''${news.description}''',
          style: {
            "p": html.Style.fromTextStyle(TextStylesApp.pragmatica400(18)),
            "li":
                html.Style(color: Colors.white, fontFamily: TextStylesApp.fontPragmatica, fontSize: html.FontSize(18)),
          },
          onLinkTap: (url, _, map, child) {
            if (url != null) {
              BlocProvider.of<RouterCubit>(context).onRouteToWebView(
                url: url,
                title: 'Новости',
              );
            }
          },
        ),
      ],
    );
  }
}
