import 'package:faneron_mobile/src/common/utils/logger.dart';
import 'package:faneron_mobile/src/common/utils/result.dart';
import 'package:faneron_mobile/src/core/data/network/service/news.dart';
import 'package:faneron_mobile/src/core/domain/entities/news.dart';
import 'package:faneron_mobile/src/core/domain/entities/news_detailed.dart';
import 'package:faneron_mobile/src/core/domain/entities/pagination_container.dart';
import 'package:faneron_mobile/src/core/domain/repository/news.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  final NewsService _newsService;

  NewsRepositoryImpl(this._newsService);

  @override
  Future<Result<PaginationContainer<News>>> getNewsList(int page) async {
    try {
      final response = await _newsService.getNewsList(page);
      return Result.success(response.toPaginationContainer<News>());
    } catch (e) {
      Log.error(e.toString());
      return Result.failure(Failure(e));
    }
  }

  @override
  Future<Result<NewsDetailed>> getNewsDetailed(int id) async {
    try {
      final response = await _newsService.getNewsDetailed(id);
      return Result.success(response.toEntity());
    } catch (e) {
      Log.error(e.toString());
      return Result.failure(Failure(e));
    }
  }
}
