import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:faneron_mobile/src/core/domain/entities/news.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class NewsItem extends StatelessWidget {
  final News newsItem;

  const NewsItem({
    Key? key,
    required this.newsItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<RouterCubit>().onRouteToNewsDetailed(int.parse(newsItem.id)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FancyShimmerImage(
            errorWidget: Container(color: Colors.grey, height: 171),
            height: 171,
            width: double.maxFinite,
            boxFit: BoxFit.fitWidth,
            imageUrl: newsItem.imageUrl,
          ),
          SizedBox(height: 12),
          Text(
            DateFormat("dd.MM.yy").format(newsItem.createdAt),
            style: TextStylesApp.pragmatica400(18),
          ),
          SizedBox(height: 4),
          Text(
            newsItem.title.toUpperCase(),
            style: TextStylesApp.drukCyr500(24),
          ),
          SizedBox(height: 32)
        ],
      ),
    );
  }
}
