class PaginatedResult<T> {
  final List<T> results;
  final bool hasMore;

  PaginatedResult({required this.results, required this.hasMore});

  PaginatedResult.empty()
      : hasMore = false,
        results = [];
}
