import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/core/domain/entities/events.dart';
import 'package:faneron_mobile/src/core/domain/repository/events.dart';
import 'package:faneron_mobile/src/core/domain/repository/profile.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/screens/event_detail/event_detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class EventDetailCubit extends Cubit<EventDetailState> {
  final RouterEventSink _routerEventSink;
  final EventsRepository _eventsRepository;
  final ProfileRepository _profileRepository;

  EventDomain? event;

  EventDetailCubit(
    @factoryParam this.event,
    this._routerEventSink,
    this._eventsRepository,
    this._profileRepository,
  ) : super(EventDetailState()) {
    getEventDetail();
    _eventsRepository.eventsPayIdListWatch.listen((eventList) {
      if (event != null) {
        emit(state.copyWith(thisPay: eventList.any((element) => element == (event!.id))));
      }
    });
  }

  getEventDetail() async {
    if (event != null) {
      var thisPayIds = await _eventsRepository.getEventsPayIdList;
      emit(state.copyWith(
        event: event,
        thisPay: thisPayIds.any((element) => element == (event!.id)),
      ));
    } else {
      Log.error('event not found');
    }
  }

  onTapRegistration() async {
    if (_profileRepository.isAuth()) {
      emit(state.copyWith(
        loadButton: true,
      ));
      var data = await _eventsRepository.payEvent(event!.id);
      Log.info(data.toString());
      if (data) {
        _routerEventSink.onRouteToSuccessPayTicketModal(event!);
      }
      emit(state.copyWith(
        loadButton: false,
      ));
    } else {
      _routerEventSink.onRouteToAuth(callback: () {
        onTapRegistration();
        _routerEventSink.onPop();
      });
    }
  }
}
