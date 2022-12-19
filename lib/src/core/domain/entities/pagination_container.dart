class PaginationContainer<T2> {
  final List<T2> data;
  final Pagination pagination;

  PaginationContainer({
    required this.data,
    required this.pagination,
  });

  int get currentPage => pagination.currentPage;

  int get totalPages => pagination.totalPages;
}

class Pagination {
  // final int total;
  // final int count;
  // final int perPage;
  final int currentPage;
  final int totalPages;

  Pagination({
    // required this.total,
    // required this.count,
    // required this.perPage,
    required this.currentPage,
    required this.totalPages,
  });
}
