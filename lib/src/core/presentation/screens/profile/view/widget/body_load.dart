import 'package:faneron_mobile/src/common/controller/scrolls.dart';
import 'package:faneron_mobile/src/core/presentation/widget/background/background_mount_body.dart';
import 'package:faneron_mobile/src/core/presentation/widget/element/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileLoadPageBody extends StatelessWidget {
  ProfileLoadPageBody({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundMountBodyScroll(
      stream: context.read<ScrollProvider>().profilePageBodyScrollOffset,
      controller: context.read<ScrollProvider>().profilePageBodyController,
      slivers: [
        SliverFillRemaining(
          child: Center(
            child: LoaderWidget(),
          ),
        ),
      ],
    );
  }
}
