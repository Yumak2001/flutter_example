import 'package:faneron_mobile/src/common/injection/injection.dart';
import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/screens/main/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

typedef MainEmit = Emitter<MainState>;

@Injectable()
class MainBloc extends Bloc<MainEvent, MainState> {
  final RouterEventSink _routerEventSink;

  MainBloc(
    this._routerEventSink,
  ) : super(MainState()) {
    on<OnLoadMainEvent>(_onLoad);

    add(OnLoadMainEvent());
  }

  _onLoad(OnLoadMainEvent event, MainEmit emit) async {
    emit(state.copyWith(screenStatus: ScreenStatus.view));
  }
}
