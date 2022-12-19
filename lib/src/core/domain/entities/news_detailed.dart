class NewsDetailed {
  final int id;
  final String title;

  ///The fields are commented out to make it easier to add them in the future if necessary.
  // final String? titleEn;
  // https://faneron.ru/news/{slug}
  final String slug;
  final String description;

  // final String? descriptionEn;
  // final String teaser;
  // final String teaserEn;
  // final String? imageUrl;
  // final bool published;
  final DateTime createdAt;
  final DateTime updatedAt;

  NewsDetailed({
    required this.id,
    required this.title,
    // required this.titleEn,
    required this.slug,
    required this.description,
    // required this.descriptionEn,
    // required this.teaser,
    // required this.teaserEn,
    // required this.imageUrl,
    // required this.published,
    required this.createdAt,
    required this.updatedAt,
  });
}
