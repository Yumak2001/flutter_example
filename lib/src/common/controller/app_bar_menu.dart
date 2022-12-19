import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class AppBarMenuShowController extends ChangeNotifier {
  static BehaviorSubject<bool> _menuView = BehaviorSubject<bool>.seeded(false);
  Stream<bool> menuView = _menuView.stream;
  static BehaviorSubject<bool> _debugMenuView = BehaviorSubject<bool>.seeded(false);
  Stream<bool> debugMenuView = _debugMenuView.stream;

  int bottomMenuPosition = 0;

  void showAndCloseMenu() {
    if (bottomMenuPosition == 0 || bottomMenuPosition == 1 || bottomMenuPosition == 3) {
      if (_menuView.value) {
        _debugMenuView.add(false);
      }
      _menuView.add(!_menuView.value);
    } else {
      closeMenu();
    }
  }

  void closeMenu() {
    _debugMenuView.add(false);
    _menuView.add(false);
  }

  void showAndCloseDebugMenu() {
    _debugMenuView.add(!_debugMenuView.value);
  }

  void setHomePagesPosition(int newBottomMenuPosition) {
    bottomMenuPosition = newBottomMenuPosition;
    closeMenu();
  }
}
