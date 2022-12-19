class InterestProfileDomain {
  final bool music;
  final bool comics;
  final bool painting;
  final bool games;
  final bool books;
  final bool technologies;
  final bool newKnowledge;
  final bool cityEvents;

  const InterestProfileDomain({
    this.music = false,
    this.comics = false,
    this.painting = false,
    this.games = false,
    this.books = false,
    this.technologies = false,
    this.newKnowledge = false,
    this.cityEvents = false,
  });

  InterestProfileDomain copyWith({
    bool? music,
    bool? comics,
    bool? painting,
    bool? games,
    bool? books,
    bool? technologies,
    bool? newKnowledge,
    bool? cityEvents,
  }) =>
      InterestProfileDomain(
        music: music ?? this.music,
        comics: comics ?? this.comics,
        painting: painting ?? this.painting,
        games: games ?? this.games,
        books: books ?? this.books,
        technologies: technologies ?? this.technologies,
        newKnowledge: newKnowledge ?? this.newKnowledge,
        cityEvents: cityEvents ?? this.cityEvents,
      );

  List<int> get toNetwork {
    List<int> result = [];
    if (music) {
      result.add(1);
    }
    if (comics) {
      result.add(2);
    }
    if (painting) {
      result.add(3);
    }
    if (games) {
      result.add(4);
    }
    if (books) {
      result.add(5);
    }
    if (technologies) {
      result.add(6);
    }
    if (newKnowledge) {
      result.add(7);
    }
    if (cityEvents) {
      result.add(8);
    }
    return result;
  }
}
