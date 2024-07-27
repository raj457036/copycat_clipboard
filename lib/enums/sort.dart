enum SortOrder {
  asc,
  desc,
}

extension SortOrderCheck on SortOrder {
  bool get isDesc => this == SortOrder.desc;
}
