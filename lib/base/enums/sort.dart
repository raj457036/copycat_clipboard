enum SortOrder { desc, asc }

extension SortOrderCheck on SortOrder {
  bool get isDesc => this == SortOrder.desc;
}
