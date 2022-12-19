import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/core/presentation/error/cubit/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/error/cubit/state.dart';
import 'package:faneron_mobile/src/core/presentation/error/error.dart';
import 'package:faneron_mobile/src/core/presentation/router/bottom_sheet.dart';
import 'package:faneron_mobile/src/core/presentation/screens/first/first.dart';
import 'package:faneron_mobile/src/core/presentation/screens/home/home.dart';
import 'package:faneron_mobile/src/resource/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../provider/screen.dart';
import 'bloc/cubit.dart';

class AppRouterDelegate extends RouterDelegate<RouteInfo>
    with PopNavigatorRouterDelegateMixin<RouteInfo>, ChangeNotifier {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouterCubit, Iterable<RouteInfo>>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, stack) {
        if (stack.isEmpty) return FirstPage(key: FirstPageKeys.page);

        ///Если произошла ошибка роутера, показывается сплашскрин
        var path = '';
        final pages = <ExamplePage>[];
        stack.forEach((page) {
          path += page.id;
          pages.add(
            ExamplePage(
              id: page.id,
              type: page.type,
              key: ValueKey(page.id),
              child: WillPopScope(
                onWillPop: () async {
                  return !Navigator.of(context).userGestureInProgress;
                },
                child: page.builder(context),
              ),
            ),
          );
        });
        Log.info(path);
        return ErrorView(
          child: Navigator(
            key: navigatorKey,
            pages: pages,
            reportsRouteUpdateToEngine: true,
            onPopPage: (route, result) {
              if (!route.didPop(result)) return false;
              if (route.settings.name != null) {
                context.read<RouterCubit>().onPop();
              }
              return true;
            },
          ),
        );
      },
    );
  }

  @override
  Future<void> setNewRoutePath(RouteInfo configuration) async {}
}

class ExamplePage<T> extends Page<T> {
  ExamplePage({
    required this.child,
    required this.type,
    required String id,
    required ValueKey key,
  }) : super(key: key, name: id);

  /// The content to be shown in the [Route] created by this page.
  final Widget child;
  final PageType type;

  @override
  Route<T> createRoute(BuildContext context) {
    var _child = AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFF0A0A0A),
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: false,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemStatusBarContrastEnforced: false,
      ),
      child: child,
    );

    switch (type) {
      case PageType.screenWithTransition:
        return PageRouteBuilder(
          settings: this,
          pageBuilder: (_, __, ___) => _child,
          transitionDuration: Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, ___, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      case PageType.screen:
        return MaterialPageRoute<T>(
          settings: this,
          builder: (_) => _child,
        );
      case PageType.dialog:
        return DialogRoute<T>(
          context: context,
          settings: this,
          builder: (_) => _child,
        );
      case PageType.bottomSheet:
        final navigator = Navigator.of(context, rootNavigator: false);
        return ModalBottomSheetRoute(
          builder: (_) => _child,
          capturedThemes: InheritedTheme.capture(from: context, to: navigator.context),
          isScrollControlled: true,
          settings: this,
          backgroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        );
    }
  }
}

enum PageType {
  screen,
  screenWithTransition,
  dialog,
  bottomSheet,
}
