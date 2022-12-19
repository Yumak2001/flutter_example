import 'package:bloc/bloc.dart';
import 'package:faneron_mobile/src/core/domain/entities/news_detailed.dart';
import 'package:faneron_mobile/src/core/domain/repository/news.dart';
import 'package:injectable/injectable.dart';

@injectable
class NewsCubit extends Cubit<NewsState> {
  final int id;
  final NewsRepository _newsRepository;

  NewsCubit(
    @factoryParam this.id,
    this._newsRepository,
  ) : super(NewsState()) {
    _onPageCreated();
  }

  _onPageCreated() => _loadNews();

  _loadNews() async {
    emit(state.copyWith(isLoading: true));
    final result = await _newsRepository.getNewsDetailed(id);
    if (result.isSuccess) {
      emit(state.copyWith(
        news: result.value,
        isLoadingFailed: false,
        isLoading: false,
      ));
    } else {
      emit(state.copyWith(
        isLoadingFailed: true,
        isLoading: false,
      ));
      state.isLoadingFailed = false;
    }
  }
}

class NewsState {
  final NewsDetailed? news;
  bool isLoadingFailed;
  final bool isLoading;

  NewsState({
    this.news,
    this.isLoadingFailed = false,
    this.isLoading = false,
  });

  NewsState copyWith({
    NewsDetailed? news,
    bool? isLoadingFailed,
    bool? isLoading,
  }) {
    return NewsState(
      news: news ?? this.news,
      isLoadingFailed: isLoadingFailed ?? this.isLoadingFailed,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
