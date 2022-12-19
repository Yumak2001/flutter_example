import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/core/domain/entities/events.dart';
import 'package:faneron_mobile/src/core/domain/repository/events.dart';
import 'package:faneron_mobile/src/core/domain/repository/profile.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:faneron_mobile/src/core/presentation/screens/laboratory/laboratory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LaboratoryCubit extends Cubit<LaboratoryState> {
  final RouterEventSink _routerEventSink;
  final EventsRepository _eventsRepository;
  final ProfileRepository _profileRepository;

  List<EventDomain>? eventsAll;

  LaboratoryCubit(
    this._routerEventSink,
    this._eventsRepository,
    this._profileRepository,
  ) : super(LaboratoryState()) {
    _eventsRepository.eventsWatch.listen((event) {
      _onEventsToView(event);
    });
    _eventsRepository.eventsPayIdListWatch.listen((event) {
      emit(state.copyWith(
        eventsPayIds: event,
      ));
    });

    _onLoad();
  }

  _onEventsToView(EventsDataDomain data) {
    eventsAll = data.events;
    emit(state.copyWith(
      tagList: data.topics,
      tagActiveIndex: (data.topics.length > 0)
          ? (data.topics.length > state.tagActiveIndex)
              ? null
              : data.topics.length - 1
          : -1,
    ));
    List<DateTime?> dateTimeList = [null];
    data.events.forEach((element) {
      var _date = DateTime(element.startEvent.year, element.startEvent.month, element.startEvent.day);
      var _i = dateTimeList.indexWhere((element) => element == _date);
      if (_i == -1) {
        dateTimeList.add(_date);
      }
    });
    emit(state.copyWith(
      dateList: dateTimeList,
      dateActiveIndex: (dateTimeList.length > 0)
          ? (dateTimeList.length > state.dateActiveIndex)
              ? null
              : dateTimeList.length - 1
          : -1,
    ));
    onViewList();
  }

  _onLoad() async {
    emit(state.copyWith(
      dateActiveIndex: 0,
      tagActiveIndex: -1,
    ));
  }

  onTapTagItem(int index) {
    emit(state.copyWith(tagActiveIndex: (state.tagActiveIndex == index) ? -1 : index));
    onViewList();
  }

  onTapDateItem(int index) {
    emit(state.copyWith(
      dateActiveIndex: index,
      tagActiveIndex: (state.dateList[index] == null) ? -1 : null,
    ));
    onViewList();
  }

  onTapRegistration(String id) async {
    if (_profileRepository.isAuth()) {
      emit(state.copyWith(
        eventLoadButtonId: id,
      ));
      var data = await _eventsRepository.payEvent(id);
      Log.info(data.toString());
      if (data) {
        _routerEventSink.onRouteToSuccessPayTicketModal(eventsAll!.firstWhere((element) => element.id == id));
      }
      emit(state.copyWith(
        eventLoadButtonId: '',
      ));
    } else {
      _routerEventSink.onRouteToAuth(callback: () {
        onTapRegistration(id);
        _routerEventSink.onPop();
      });
    }
  }

  onChangeSearch(String text) async {
    emit(state.copyWith(
      searchText: text,
    ));
    onViewList();
  }

  onViewList() async {
    DateTime? date = state.dateActiveIndex != -1 ? state.dateList[state.dateActiveIndex] : null;
    TopicDomain? category = state.tagActiveIndex != -1 ? state.tagList[state.tagActiveIndex] : null;
    String searchText = state.searchText;
    List<EventDomain> result = [];
    List<DateTime> hideDate = [];
    int? activeIndexDate = null;

    ///Фильтруем по выбраной категории
    if (category != null) {
      eventsAll!.forEach((element) {
        if (element.topicId == category.id) {
          result.add(element);
        }
      });
    } else {
      eventsAll!.forEach((element) {
        result.add(element);
      });
    }

    ///Удаляем из отображаемых не соответствие поисковому запросу
    result.removeWhere((element) {
      return !(element.title.toLowerCase().contains(searchText.toLowerCase()));
    });

    ///Скрываем даты, для которых не отображаеться мероприятие
    state.dateList.forEach((e) {
      if (e != null) {
        var index = result.indexWhere((element) {
          var _date = DateTime(element.startEvent.year, element.startEvent.month, element.startEvent.day);
          return _date == e;
        });
        if (index == -1) {
          if (e == state.dateList[state.dateActiveIndex]) {
            activeIndexDate = 0;
            date = null;
          }
          hideDate.add(e);
        }
      }
    });

    ///Убираем не соответствие выбраной дате
    if (date != null) {
      result.removeWhere((element) {
        var _date = DateTime(element.startEvent.year, element.startEvent.month, element.startEvent.day);
        return (_date != date);
      });
    }
    emit(state.copyWith(
      eventsViewList: result,
      dateHideList: hideDate,
      dateActiveIndex: activeIndexDate,
    ));
  }
}
