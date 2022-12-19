class News {
  final String id;
  final String title;
  ///The fields are commented out to make it easier to add them in the future if necessary.
  // final String? titleEn;
  final String description;

  // final String? descriptionEn;
  // final String slug;
  // final String teaser;
  // final String? teaserEn;
  final String imageUrl;
  final bool published;
  final DateTime createdAt;
  final DateTime? updatedAt;

  News({
    required this.title,
    // required this.titleEn,
    required this.description,
    // required this.descriptionEn,
    // required this.slug,
    // required this.teaser,
    // required this.teaserEn,
    required this.imageUrl,
    required this.published,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });
}

