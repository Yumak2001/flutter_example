import 'package:faneron_mobile/src/core/data/network/client.dart';
import 'package:faneron_mobile/src/core/data/network/models/news.dart';
import 'package:faneron_mobile/src/core/data/network/models/news_detailed.dart';
import 'package:faneron_mobile/src/core/data/network/models/pagination_response.dart';
import 'package:injectable/injectable.dart';

abstract class NewsService {
  Future<PaginationResponseDto<NewsDto>> getNewsList(int page);

  Future<NewsDetailedDto> getNewsDetailed(int id);
}

@Injectable(as: NewsService)
class NewsServiceImpl implements NewsService {
  final Api api;

  NewsServiceImpl(this.api);

  @override
  Future<PaginationResponseDto<NewsDto>> getNewsList(int page) async {
    final result = await api.client.get(
      '/news',
      queryParameters: {"page": page},
    );
    return PaginationResponseDto.fromJson(result.data, (e) => NewsDto.fromJson(e as Map<String, dynamic>));
  }

  @override
  Future<NewsDetailedDto> getNewsDetailed(int id) async {
    final result = await api.client.get(
      '/news/$id',
      queryParameters: {},
    );
    return NewsDetailedDto.fromJson(result.data["data"]);
  }
}
