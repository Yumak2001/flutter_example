abstract class ErrorsRepository {
  Stream<ErrorTypes> get watchError;
  Future<void> setError(ErrorTypes error);
}

enum ErrorTypes {
  networkError,
  loadData,
  customError,
  unAuth,
}

extension ErrorTypeToString on ErrorTypes {
  String get toStringError {
    switch (this) {
      case ErrorTypes.networkError:
        return 'Отсутвствует подключение к интернету.';
      case ErrorTypes.loadData:
        return 'Не удалось получить данные.';
      case ErrorTypes.customError:
        return 'Произошла непредвиденая ошибка.';
      case ErrorTypes.unAuth:
        return 'Нужно авторизоваться';
    }
  }
}
