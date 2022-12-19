import 'package:bloc/bloc.dart';
import 'package:faneron_mobile/src/core/domain/entities/news.dart';
import 'package:faneron_mobile/src/core/domain/repository/news.dart';
import 'package:injectable/injectable.dart';

@injectable
class NewsListCubit extends Cubit<NewsListState> {
  final NewsRepository _newsRepository;

  NewsListCubit(
    this._newsRepository,
  ) : super(NewsListState()) {
    _onPageCreated();
  }

  _onPageCreated() => _loadNews();

  onEndReached() => _loadNews();

  _loadNews() async {
    if (!state.isLoading && state.currentPage < state.totalPages) {
      emit(state.copyWith(isLoading: true));
      final result = await _newsRepository.getNewsList(state.currentPage + 1);
      if (result.isSuccess) {
        emit(state.copyWith(
            currentPage: result.value!.currentPage,
            totalPages: result.value!.totalPages,
            news: List.from(state.newsList)..addAll(result.value!.data),
            isLoadingFailed: false,
            isLoading: false));
      } else {
        emit(state.copyWith(
          isLoadingFailed: true,
          isLoading: false,
        ));
      }
    }
  }
}

class NewsListState {
  final int totalPages;
  final int currentPage;
  final List<News> newsList;
  final bool isLoadingFailed;
  final bool isLoading;

  const NewsListState({
    this.totalPages = 1,
    this.currentPage = 0,
    this.newsList = const [],
    this.isLoadingFailed = false,
    this.isLoading = false,
  });

  NewsListState copyWith({
    final int? totalPages,
    final int? currentPage,
    final List<News>? news,
    final bool? isLoadingFailed,
    final bool? isLoading,
  }) {
    return NewsListState(
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
      newsList: news ?? this.newsList,
      isLoadingFailed: isLoadingFailed ?? this.isLoadingFailed,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsListState &&
          runtimeType == other.runtimeType &&
          totalPages == other.totalPages &&
          currentPage == other.currentPage &&
          newsList == other.newsList &&
          isLoadingFailed == other.isLoadingFailed &&
          isLoading == other.isLoading;
}
