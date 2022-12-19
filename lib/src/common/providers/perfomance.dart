import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class PerformanceProvider extends ChangeNotifier {
  bool isShowPerformance = false;
  BehaviorSubject<bool> performanceController = BehaviorSubject.seeded(false);

  changeStatus(bool value) {
    isShowPerformance = value;
    performanceController.add(isShowPerformance);
    notifyListeners();
  }

  @override
  void dispose() {
    performanceController.close();
    return super.dispose();
  }
}
