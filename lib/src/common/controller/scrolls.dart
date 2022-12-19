import 'package:faneron_mobile/src/core/presentation/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class ScrollProvider extends ChangeNotifier {
  final ScrollController mainPageBodyController = ScrollController();
  final ScrollController laboratoryPageBodyController = ScrollController();
  final ScrollController navigationPageBodyController = ScrollController();
  final ScrollController profilePageBodyController = ScrollController();
  final ScrollController settingProfilePageBodyController = ScrollController();
  final ScrollController newsListPageBodyController = ScrollController();
  final ScrollController expositionPageBodyController = ScrollController();

  static BehaviorSubject<double> _mainPageBodyScrollOffsetController = BehaviorSubject<double>.seeded(0);
  Stream<double> mainPageBodyScrollOffset = _mainPageBodyScrollOffsetController.stream;

  static BehaviorSubject<double> _laboratoryPageBodyScrollOffsetController = BehaviorSubject<double>.seeded(0);
  Stream<double> laboratoryPageBodyScrollOffset = _laboratoryPageBodyScrollOffsetController.stream;

  static BehaviorSubject<double> _navigationPageBodyScrollOffsetController = BehaviorSubject<double>.seeded(0);
  Stream<double> navigationPageBodyScrollOffset = _navigationPageBodyScrollOffsetController.stream;

  static BehaviorSubject<double> _profilePageBodyScrollOffsetController = BehaviorSubject<double>.seeded(0);
  Stream<double> profilePageBodyScrollOffset = _profilePageBodyScrollOffsetController.stream;

  static BehaviorSubject<double> _newsListPageBodyScrollOffsetController = BehaviorSubject<double>.seeded(0);
  Stream<double> newsListPageBodyScrollOffset = _newsListPageBodyScrollOffsetController.stream;

  static BehaviorSubject<double> _expositionPageBodyScrollOffsetController = BehaviorSubject<double>.seeded(0);
  Stream<double> expositionPageBodyScrollOffset = _expositionPageBodyScrollOffsetController.stream;

  ScrollProvider() {
    mainPageBodyController.addListener(() {
      _mainPageBodyScrollOffsetController.add(mainPageBodyController.offset);
    });
    laboratoryPageBodyController.addListener(() {
      _laboratoryPageBodyScrollOffsetController.add(laboratoryPageBodyController.offset);
    });
    navigationPageBodyController.addListener(() {
      _navigationPageBodyScrollOffsetController.add(navigationPageBodyController.offset);
    });
    newsListPageBodyController.addListener(() {
      _newsListPageBodyScrollOffsetController.add(newsListPageBodyController.offset);
    });
    profilePageBodyController.addListener(() {
      _profilePageBodyScrollOffsetController.add(profilePageBodyController.offset);
    });
    expositionPageBodyController.addListener(() {
      _expositionPageBodyScrollOffsetController.add(expositionPageBodyController.offset);
    });
  }

  void mainPageSetScroll(
    double offset, {
    Duration? duration,
  }) {
    mainPageBodyController.animateTo(
      offset,
      duration: duration ?? ConstantsApp.durationPageScroll,
      curve: Curves.easeIn,
    );
  }

  void laboratoryPageSetScroll(
    double offset, {
    Duration? duration,
  }) {
    laboratoryPageBodyController.animateTo(
      offset,
      duration: duration ?? ConstantsApp.durationPageScroll,
      curve: Curves.easeIn,
    );
  }

  void expositionPageScroll(
    double offset, {
    Duration? duration,
  }) {
    expositionPageBodyController.animateTo(
      offset,
      duration: duration ?? ConstantsApp.durationPageScroll,
      curve: Curves.easeIn,
    );
  }

  void profilePageScroll(
    double offset, {
    Duration? duration,
  }) {
    profilePageBodyController.animateTo(
      offset,
      duration: duration ?? ConstantsApp.durationPageScroll,
      curve: Curves.easeIn,
    );
  }

  void setNewsListPageScroll(
    double offset, {
    Duration? duration,
  }) {
    newsListPageBodyController.animateTo(
      offset,
      duration: duration ?? ConstantsApp.durationPageScroll,
      curve: Curves.easeIn,
    );
  }
}
