import 'package:faneron_mobile/src/core/domain/entities/events.dart';
import 'package:faneron_mobile/src/core/presentation/provider/screen.dart';
import 'package:faneron_mobile/src/core/presentation/router/router.dart';
import 'package:faneron_mobile/src/core/presentation/screens/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

abstract class RouterEventSink {
  onPop();

  onRouteToSplashOnBoardingScreen();
  onRouteToHome();
  onRouteToAuth({required Function callback});
  onRouteToTickets();
  onRouteToSettingProfile();
  onRouteToImagePicker(String path);
  onRouteToEventDetail(EventDomain event);
  onRouteToSuccessPayTicketModal(EventDomain event);
  onRouteToNewsList();
  onRouteToNewsDetailed(int newsId);
  onRouteToContacts();
  onRouteToQuestionAnswer();
  onRouteToBuyTicketExposition();
  onTapBottomMenu(int index);
  onRouteToFeedbackDialog();
  onRouteToWebView({required String url, String? title});
}

@Singleton(as: RouterEventSink)
class RouterCubit extends Cubit<List<RouteInfo>> implements RouterEventSink {
  RouterCubit() : super([ScreenProvider.first()]);

  int indexBottomMenuScreen = 0;

  onPop() async {
    if (state.last.id != HomePage.id) {
      emit([...state..removeLast()]);
    }
  }

  onRouteToSplashOnBoardingScreen() {
    state.clear();
    emit(openPage(ScreenProvider.splashOnBoarding()));
  }

  onRouteToHome() async {
    state.clear();
    emit(openPage(ScreenProvider.home()));
  }

  onRouteToAuth({required Function callback}) async {
    emit(openPage(ScreenProvider.auth(false, callback: callback)));
  }

  onRouteToEditPass() async {
    emit(openPage(ScreenProvider.auth(true, callback: () {})));
  }

  onRouteToTickets() async {
    emit(openPage(ScreenProvider.tickets()));
  }

  onRouteToSettingProfile() async {
    emit(openPage(ScreenProvider.settingProfile()));
  }

  onRouteToImagePicker(String path) async {
    emit(openPage(ScreenProvider.imagePicker(path)));
  }

  onRouteToNewsList() {
    emit(openPage(ScreenProvider.newsList()));
  }

  onRouteToNewsDetailed(int newsId) {
    emit(openPage(ScreenProvider.newsDetailed(newsId)));
  }

  onRouteToContacts() {
    emit(openPage(ScreenProvider.contacts()));
  }


  onRouteToWebView({required String url, String? title}) {
    emit(openPage(
      ScreenProvider.webView(url, title)
    ));
  }

  onRouteToQuestionAnswer() {
    emit(openPage(ScreenProvider.questionAnswer()));
  }

  onRouteToEventDetail(EventDomain event) {
    emit(openPage(ScreenProvider.eventDetail(event)));
  }

  onRouteToSuccessPayTicketModal(EventDomain event) {
    emit(openPage(ScreenProvider.successPayTicket(event)));
  }

  @override
  onRouteToBuyTicketExposition() {
    emit(openPage(ScreenProvider.buyTicketExposition()));
  }

  onRouteToUploadImageModal(Function(String path) callback) {
    emit(openPage(ScreenProvider.uploadImage(callback)));
  }

  @override
  onRouteToFeedbackDialog() {
    emit(openPage(ScreenProvider.feedBackDialog()));
  }

  onRouteToNavigation() {
    emit(openPage(ScreenProvider.navigation()));
  }

  onRouteToComics() {
    emit(openPage(ScreenProvider.comics()));
  }

  List<RouteInfo> openPage(RouteInfo curr, [List<String>? limitOpenPage]) {
    List<RouteInfo> thisState = state;
    if (thisState.any((element) => element.id == curr.id)) {
      return thisState;
    }
    limitOpenPage ??= [];
    if (limitOpenPage.isEmpty || limitOpenPage.any((id) => id == thisState.last.id)) {
      //Закрываем модалки при открытии любого окна
      if (thisState.isNotEmpty &&
          (thisState.last.type == PageType.bottomSheet || thisState.last.type == PageType.dialog)) {
        thisState.removeLast();
      }
      return [...thisState, curr];
    }
    return thisState;
  }

  onTapBottomMenu(int index) {
    indexBottomMenuScreen = index;
  }
}
