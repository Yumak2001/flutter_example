import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/core/domain/repository/errors.dart';
import 'package:faneron_mobile/src/core/presentation/error/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ErrorCubit extends Cubit<ErrorState> {
  final ErrorsRepository _errorsRepository;

  ErrorCubit(
    this._errorsRepository,
  ) : super(ErrorState()) {
    _errorsRepository.watchError.listen((event) {
      onViewError(event);
    });
  }

  onViewError(ErrorTypes errorTypes) async {
    if (state.errorTypes == null) {
      emit(state.copyWith(isLight: true, errorTypes: errorTypes));
      await Future.delayed(Duration(seconds: 3));
      emit(state.copyWith(isLight: true));
    }
  }
}
