import 'package:faneron_mobile/src/core/domain/repository/errors.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: ErrorsRepository)
class ErrorsRepositoryImpl implements ErrorsRepository {
  final errorStreamController = BehaviorSubject<ErrorTypes>();

  Stream<ErrorTypes> get watchError => errorStreamController.stream;

  Future<void> setError(ErrorTypes error) async {
    errorStreamController.add(error);
  }
}
