import 'package:faneron_mobile/src/common/injection/injection.dart';
import 'package:faneron_mobile/src/core/domain/entities/events.dart';
import 'package:faneron_mobile/src/core/presentation/dialogs/feedback_dialog/body.dart';
import 'package:faneron_mobile/src/core/presentation/router/router.dart';
import 'package:faneron_mobile/src/core/presentation/screens/auth/auth.dart';
import 'package:faneron_mobile/src/core/presentation/screens/comics/comics.dart';
import 'package:faneron_mobile/src/core/presentation/screens/buy_ticket_exposition/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/screens/buy_ticket_exposition/page.dart';
import 'package:faneron_mobile/src/core/presentation/screens/contacts/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/screens/contacts/page.dart';
import 'package:faneron_mobile/src/core/presentation/screens/event_detail/event_detail.dart';
import 'package:faneron_mobile/src/core/presentation/screens/first/first.dart';
import 'package:faneron_mobile/src/core/presentation/screens/home/home.dart';
import 'package:faneron_mobile/src/core/presentation/screens/image_picker/image_picker.dart';
import 'package:faneron_mobile/src/core/presentation/screens/navigation/navigation.dart';
import 'package:faneron_mobile/src/core/presentation/screens/news_detailed/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/screens/news_detailed/page.dart';
import 'package:faneron_mobile/src/core/presentation/screens/news_list/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/screens/news_list/page.dart';
import 'package:faneron_mobile/src/core/presentation/screens/question_answer/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/screens/question_answer/page.dart';
import 'package:faneron_mobile/src/core/presentation/screens/setting_profile/setting_profile.dart';
import 'package:faneron_mobile/src/core/presentation/screens/splash_on_boarding/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/screens/splash_on_boarding/splash.dart';
import 'package:faneron_mobile/src/core/presentation/screens/success_pay_ticket/success_pay_ticket.dart';
import 'package:faneron_mobile/src/core/presentation/screens/tickets/tickets.dart';
import 'package:faneron_mobile/src/core/presentation/screens/web_view/web_view.dart';
import 'package:faneron_mobile/src/core/presentation/screens/upload_image/upload_image.dart';
import 'package:faneron_mobile/src/resource/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenProvider {
  /// Screens
  static RouteInfo first() => RouteInfo(
        id: FirstPage.id,
        builder: (_) => BlocProvider<FirstBloc>(
          create: (_) => getIt<FirstBloc>(),
          child: FirstPage(key: FirstPageKeys.page),
        ),
      );

  static RouteInfo splashOnBoarding() => RouteInfo(
        id: SplashOnBoardingPage.id,
        builder: (_) => BlocProvider(
            create: (BuildContext context) => getIt<SplashOnBoardingCubit>(),
            child: SplashOnBoardingPage(key: SplashPageKeys.page)),
      );

  static RouteInfo home() => RouteInfo(
        type: PageType.screenWithTransition,
        id: HomePage.id,
        builder: (_) => BlocProvider<HomeCubit>(
          create: (_) => getIt<HomeCubit>(),
          child: HomePage(
            key: HomePageKeys.page,
          ),
        ),
      );
  static RouteInfo auth(bool editPass, {required Function callback}) => RouteInfo(
        id: AuthPage.id,
        builder: (_) => BlocProvider<AuthBloc>(
          create: (_) => getIt<AuthBloc>(
            param1: editPass,
            param2: callback,
          ),
          child: AuthPage(
            key: AuthPageKeys.page,
          ),
        ),
      );
  static RouteInfo tickets() => RouteInfo(
        id: TicketsPage.id,
        builder: (_) => BlocProvider<TicketsCubit>(
          create: (_) => getIt<TicketsCubit>(),
          child: TicketsPage(
            key: TicketsPageKeys.page,
          ),
        ),
      );
  static RouteInfo settingProfile() => RouteInfo(
        id: SettingProfilePage.id,
        builder: (_) => BlocProvider<SettingProfileCubit>(
          create: (_) => getIt<SettingProfileCubit>(),
          child: SettingProfilePage(
            key: SettingProfilePageKeys.page,
          ),
        ),
      );
  static RouteInfo imagePicker(String path) => RouteInfo(
        id: ImagePickerPage.id,
        builder: (_) => BlocProvider<ImagePickerCubit>(
          create: (_) => getIt<ImagePickerCubit>(),
          child: ImagePickerPage(
            key: ImagePickerPageKeys.page,
            path: path,
          ),
        ),
      );
  static RouteInfo newsList() => RouteInfo(
        id: NewsListPage.id,
        builder: (_) => BlocProvider<NewsListCubit>(
          create: (_) => getIt<NewsListCubit>(),
          child: NewsListPage(key: NewsListPageKeys.page),
        ),
      );

  static RouteInfo newsDetailed(int newsId) => RouteInfo(
        id: NewsDetailedPage.id,
        builder: (_) => BlocProvider(
          create: (_) => getIt<NewsCubit>(param1: newsId),
          child: NewsDetailedPage(
            key: NewsDetailedPageKeys.page,
          ),
        ),
      );

  static RouteInfo contacts() => RouteInfo(
        id: ContactsPage.id,
        builder: (_) => BlocProvider(
          create: (_) => getIt<ContactsCubit>(),
          child: ContactsPage(
            key: ContactsPageKeys.page,
          ),
        ),
      );

  static RouteInfo questionAnswer() => RouteInfo(
        id: QuestionAnswerPage.id,
        builder: (_) => BlocProvider(
          create: (_) => getIt<QuestionAnswerCubit>(),
          child: QuestionAnswerPage(
            key: QuestionAnswerPageKeys.page,
          ),
        ),
      );
  static RouteInfo eventDetail(EventDomain event) => RouteInfo(
        id: EventDetailPage.id,
        builder: (_) => BlocProvider(
          create: (_) => getIt<EventDetailCubit>(param1: event),
          child: EventDetailPage(
            key: EventDetailPageKeys.page,
          ),
        ),
      );

  static RouteInfo successPayTicket(EventDomain event) => RouteInfo(
        id: SuccessPayTicketModal.id,
        builder: (_) => SuccessPayTicketModal(event),
        type: PageType.bottomSheet,
      );
  static RouteInfo uploadImage(Function(String path) callback) => RouteInfo(
        id: UploadImageModal.id,
        builder: (_) => UploadImageModal(callback),
        type: PageType.bottomSheet,
      );
  static RouteInfo navigation() => RouteInfo(
        id: NavigationPage.id,
        builder: (_) => NavigationPage(
          key: NavigationPageKeys.page,
        ),
      );
  static RouteInfo comics() => RouteInfo(
        id: ComicsPage.id,
        builder: (_) => ComicsPage(
          key: ComicsPageKeys.page,
        ),
      );
  static RouteInfo buyTicketExposition() => RouteInfo(
        id: BuyTicketExpositionPage.id,
        builder: (_) => BlocProvider<BuyTicketExpositionCubit>(
            create: (_) => getIt<BuyTicketExpositionCubit>(),
            child: BuyTicketExpositionPage(
              key: BuyTicketExpositionKeys.page,
            )),
      );

  static RouteInfo feedBackDialog() => RouteInfo(
        id: BuyTicketExpositionPage.id,
        type: PageType.dialog,
        builder: (_) => FeedBackDialog(),
      );

  static RouteInfo webView(String url, String? title) => RouteInfo(
        id: WebViewPage.id,
        builder: (_) => WebViewPage(
          key: WebViewPageKeys.page,
          url: url,
          title: title,
        ),
      );
}

class RouteInfo {
  RouteInfo({
    required this.id,
    this.type = PageType.screen,
    required this.builder,
  });

  final String id;
  final WidgetBuilder builder;
  PageType type;

  @override
  String toString() {
    return 'Route: {id: $id, builder: $builder}';
  }
}
