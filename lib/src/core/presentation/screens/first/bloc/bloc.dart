import 'dart:async';

import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../first.dart';

typedef FirstEmit = Emitter<FirstState>;

@Injectable()
class FirstBloc extends Bloc<FirstEvent, FirstState> {
  final RouterEventSink _routerEventSink;

  FirstBloc(
    this._routerEventSink,
  ) : super(FirstState()) {
    on<OnLoadFirstEvent>(_onLoad);

    add(OnLoadFirstEvent());
  }

  _onLoad(OnLoadFirstEvent event, FirstEmit emit) async {
    _routerEventSink.onRouteToSplashOnBoardingScreen();
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
