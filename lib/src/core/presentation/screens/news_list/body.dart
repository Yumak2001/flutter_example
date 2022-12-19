import 'package:faneron_mobile/src/common/controller/scrolls.dart';
import 'package:faneron_mobile/src/core/presentation/screens/news_list/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/widget/element/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/main_title.dart';
import 'widget/news_item.dart';

class NewsListPageBody extends StatefulWidget {
  const NewsListPageBody({Key? key}) : super(key: key);

  @override
  State<NewsListPageBody> createState() => _NewsListPageBodyState();
}

class _NewsListPageBodyState extends State<NewsListPageBody> {
  late final ScrollController controller;

  @override
  void initState() {
    controller = context.read<ScrollProvider>().newsListPageBodyController;
    controller.addListener(_listener);
    super.initState();
  }

  void _listener() {
    if (context.read<ScrollProvider>().newsListPageBodyController.position.extentAfter < 300) {
      context.read<NewsListCubit>().onEndReached();
    }
  }

  @override
  void dispose() {
    controller.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsListCubit, NewsListState>(
      builder: (BuildContext context, state) {
        return CustomScrollView(
          controller: controller,
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    MainTitle(),
                    SizedBox(height: 20),
                    ...state.newsList.map((e) => NewsItem(newsItem: e)),
                    if (state.isLoading) Center(child: LoaderWidget())
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
