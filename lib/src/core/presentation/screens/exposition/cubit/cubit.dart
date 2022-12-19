import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/screens/exposition/exposition.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ExpositionCubit extends Cubit<ExpositionState> {
  final RouterEventSink _routerEventSink;

  ExpositionCubit(
    this._routerEventSink,
  ) : super(ExpositionState());
}
