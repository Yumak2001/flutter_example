import 'package:faneron_mobile/src/common/utils/result.dart';
import 'package:faneron_mobile/src/core/domain/entities/news.dart';
import 'package:faneron_mobile/src/core/domain/entities/news_detailed.dart';
import 'package:faneron_mobile/src/core/domain/entities/pagination_container.dart';

abstract class NewsRepository {
  Future<Result<PaginationContainer<News>>> getNewsList(int page);

  Future<Result<NewsDetailed>> getNewsDetailed(int id);
}
