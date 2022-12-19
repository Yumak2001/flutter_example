import 'package:faneron_mobile/src/core/presentation/widget/element/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'cubit.dart';
import 'widget/news_success.dart';

class NewsDetailedPageBody extends StatelessWidget {
  const NewsDetailedPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (BuildContext context, state) {
        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    state.isLoadingFailed
                        ? Center(child: Text("failed"))
                        : state.isLoading
                            ? Center(child: LoaderWidget())
                            : NewsWidget(news: state.news!),
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


