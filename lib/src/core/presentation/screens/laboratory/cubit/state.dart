import 'package:faneron_mobile/src/core/domain/entities/events.dart';
import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';

class LaboratoryState {
  final ScreenStatus screenStatus;
  final List<TopicDomain> tagList;
  final List<DateTime?> dateList;
  final List<DateTime> dateHideList;
  final List<EventDomain>? eventsViewList;
  final int tagActiveIndex;
  final int dateActiveIndex;
  final List<String> eventsPayIds;
  final String eventLoadButtonId;
  final String searchText;

  LaboratoryState({
    this.screenStatus = ScreenStatus.loading,
    this.tagList = const [],
    this.dateList = const [],
    this.dateHideList = const [],
    this.tagActiveIndex = -1,
    this.dateActiveIndex = -1,
    this.eventsViewList,
    this.eventsPayIds = const [],
    this.eventLoadButtonId = '',
    this.searchText = '',
  });

  LaboratoryState copyWith({
    ScreenStatus? screenStatus,
    List<TopicDomain>? tagList,
    List<DateTime?>? dateList,
    List<DateTime>? dateHideList,
    List<EventDomain>? eventsViewList,
    int? tagActiveIndex,
    int? dateActiveIndex,
    List<String>? eventsPayIds,
    String? eventLoadButtonId,
    String? searchText,
  }) =>
      LaboratoryState(
        screenStatus: screenStatus ?? this.screenStatus,
        tagList: tagList ?? this.tagList,
        dateList: dateList ?? this.dateList,
        dateHideList: dateHideList ?? this.dateHideList,
        tagActiveIndex: tagActiveIndex ?? this.tagActiveIndex,
        dateActiveIndex: dateActiveIndex ?? this.dateActiveIndex,
        eventsViewList: eventsViewList ?? this.eventsViewList,
        eventsPayIds: eventsPayIds ?? this.eventsPayIds,
        eventLoadButtonId: eventLoadButtonId ?? this.eventLoadButtonId,
        searchText: searchText ?? this.searchText,
      );
}
