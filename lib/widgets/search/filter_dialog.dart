import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/domain/sources/clipboard.dart';
import 'package:copycat_base/enums/clip_type.dart';
import 'package:copycat_base/enums/sort.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/datetime_extension.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchFilterState {
  final DateTime? from;
  final DateTime? to;
  final Set<ClipItemType>? typeIncludes;
  final Set<TextCategory>? textCategories;
  final ClipboardSortKey? sortBy;
  final SortOrder? sortOrder;

  const SearchFilterState({
    this.from,
    this.to,
    this.typeIncludes,
    this.textCategories,
    this.sortBy,
    this.sortOrder,
  });

  bool get isActive =>
      from != null ||
      to != null ||
      typeIncludes != null ||
      textCategories != null;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchFilterState &&
        other.from == from &&
        other.to == to &&
        setEquals(other.typeIncludes, typeIncludes) &&
        setEquals(other.textCategories, textCategories) &&
        other.sortBy == sortBy &&
        other.sortOrder == sortOrder;
  }

  @override
  int get hashCode {
    return from.hashCode ^
        to.hashCode ^
        typeIncludes.hashCode ^
        textCategories.hashCode ^
        sortBy.hashCode ^
        sortOrder.hashCode;
  }
}

const _allClipCatergories = {
  ClipItemType.text,
  ClipItemType.url,
  ClipItemType.media,
  ClipItemType.file,
};

class FilterDialog extends StatefulWidget {
  final SearchFilterState state;
  const FilterDialog({
    super.key,
    required this.state,
  });

  Future<SearchFilterState?> open(BuildContext context) {
    return showDialog<SearchFilterState?>(
      context: context,
      builder: (innerContext) => this,
    );
  }

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  DateTime? from, to;
  late Set<ClipItemType> typeIncludes;
  late Set<TextCategory> textCategory;
  late ClipboardSortKey sortBy;
  SortOrder sortOrder = SortOrder.desc;

  @override
  void initState() {
    super.initState();
    if (widget.state.typeIncludes == null) {
      typeIncludes = {..._allClipCatergories};
    } else {
      typeIncludes = {...?widget.state.typeIncludes};
    }

    textCategory = {...?widget.state.textCategories};

    sortBy = widget.state.sortBy ?? ClipboardSortKey.modified;
    sortOrder = widget.state.sortOrder ?? SortOrder.desc;
    from = widget.state.from;
    to = widget.state.to;
  }

  void setTextCategory(bool include, TextCategory type) {
    setState(() {
      if (include) {
        textCategory.add(type);
      } else {
        textCategory.remove(type);
      }
    });
  }

  void setTypeInclusion(bool include, ClipItemType type) {
    setState(() {
      if (include) {
        typeIncludes.add(type);
      } else {
        typeIncludes.remove(type);
      }
      if (typeIncludes.isEmpty) {
        typeIncludes = {..._allClipCatergories};
      }
    });
  }

  Future<DateTime?> selectDate({
    required DateTime firstDate,
    required DateTime lastDate,
    DateTime? initial,
  }) async {
    final selectedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDate: initial,
    );
    return selectedDate;
  }

  Future<void> selectFrom() async {
    final firstDate = DateTime(2023);
    final lastDate = to?.subtract(const Duration(days: 1)) ?? now();
    final from_ = await selectDate(
      firstDate: firstDate,
      lastDate: lastDate,
      initial: from,
    );

    if (mounted) {
      setState(() {
        from = from_;
      });
    }
  }

  Future<void> selectTo() async {
    final firstDate = from?.add(const Duration(days: 1)) ?? DateTime(2023);
    final lastDate = now();
    final to_ = await selectDate(
      firstDate: firstDate,
      lastDate: lastDate,
      initial: to,
    );

    if (mounted) {
      setState(() {
        to = to_?.add(Duration(
          hours: lastDate.hour,
          minutes: lastDate.minute,
          seconds: lastDate.second,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = context.mq.size;
    if (size.width < 300) {
      return const AlertDialog(
        content: Center(child: Text("∅")),
      );
    }
    final locale = context.locale;
    final localeName = locale.localeName;
    final dateFormatter = getLocaleDateFormatter(localeName);
    final textTheme = context.textTheme;
    final colors = context.colors;
    return AlertDialog(
      insetPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      title: Row(
        children: [
          Text(locale.searchFilters),
          const Spacer(),
          if (size.height < 300)
            ElevatedButton(
              onPressed: applyFilter,
              child: Text(locale.applyFilter),
            ),
        ],
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(locale.from),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: selectFrom,
                    child: Text(
                      from != null
                          ? dateFormatter.format(from!)
                          : locale.select,
                    ),
                  )
                ],
              ),
              height8,
              Row(
                children: [
                  Text(locale.to),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: selectTo,
                    child: Text(
                      to != null ? dateFormatter.format(to!) : locale.now,
                    ),
                  )
                ],
              ),
              height8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(locale.including),
                  height8,
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      FilterChip(
                        label: Text(locale.text),
                        onSelected: (_) =>
                            setTypeInclusion(_, ClipItemType.text),
                        selected: typeIncludes.contains(ClipItemType.text),
                      ),
                      FilterChip(
                        label: Text(locale.url),
                        onSelected: (_) =>
                            setTypeInclusion(_, ClipItemType.url),
                        selected: typeIncludes.contains(ClipItemType.url),
                      ),
                      FilterChip(
                        label: Text(locale.media),
                        onSelected: (_) =>
                            setTypeInclusion(_, ClipItemType.media),
                        selected: typeIncludes.contains(ClipItemType.media),
                      ),
                      FilterChip(
                        label: Text(locale.docs),
                        onSelected: (_) =>
                            setTypeInclusion(_, ClipItemType.file),
                        selected: typeIncludes.contains(ClipItemType.file),
                      ),
                    ],
                  )
                ],
              ),
              height12,
              if (typeIncludes.contains(ClipItemType.text))
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text.rich(TextSpan(text: locale.textCategories, children: [
                      TextSpan(
                        text: " ${locale.exclusive}",
                        style: textTheme.bodySmall?.copyWith(
                          color: colors.outline,
                        ),
                      ),
                    ])),
                    height8,
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        FilterChip(
                          label: Text(locale.email),
                          onSelected: (_) =>
                              setTextCategory(_, TextCategory.email),
                          selected: textCategory.contains(TextCategory.email),
                        ),
                        FilterChip(
                          label: Text(locale.phone),
                          onSelected: (_) =>
                              setTextCategory(_, TextCategory.phone),
                          selected: textCategory.contains(TextCategory.phone),
                        ),
                        FilterChip(
                          label: Text(locale.color),
                          onSelected: (_) =>
                              setTextCategory(_, TextCategory.color),
                          selected: textCategory.contains(TextCategory.color),
                        ),
                      ],
                    )
                  ],
                ),
              height8,
              const Divider(),
              height8,
              OverflowBar(
                spacing: 10,
                overflowSpacing: 10,
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(locale.sortBy),
                  DropdownMenu<ClipboardSortKey>(
                    hintText: locale.select,
                    inputDecorationTheme: const InputDecorationTheme(
                      border: OutlineInputBorder(
                        borderRadius: radius12,
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.black12,
                      filled: true,
                      isDense: true,
                    ),
                    textStyle: textTheme.bodyMedium,
                    dropdownMenuEntries: [
                      DropdownMenuEntry(
                        value: ClipboardSortKey.modified,
                        label: locale.lastModified,
                      ),
                      DropdownMenuEntry(
                        value: ClipboardSortKey.created,
                        label: locale.created,
                      ),
                      DropdownMenuEntry(
                        value: ClipboardSortKey.copyCount,
                        label: locale.copyCount,
                      ),
                      DropdownMenuEntry(
                        value: ClipboardSortKey.lastCopied,
                        label: locale.lastCopied,
                      ),
                    ],
                    onSelected: selectSortBy,
                    initialSelection: sortBy,
                  )
                ],
              ),
              height8,
              OverflowBar(
                spacing: 10,
                overflowSpacing: 10,
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(locale.sortOrder),
                  SegmentedButton<SortOrder>(
                    segments: [
                      ButtonSegment(
                        value: SortOrder.asc,
                        label: Text(locale.asc),
                      ),
                      ButtonSegment(
                        value: SortOrder.desc,
                        label: Text(locale.desc),
                      ),
                    ],
                    onSelectionChanged: setSortOrder,
                    selected: {sortOrder},
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: size.height > 300
          ? [
              ElevatedButton(
                onPressed: applyFilter,
                child: Text(locale.applyFilter),
              ),
            ]
          : null,
    );
  }

  void applyFilter() {
    final searchState = SearchFilterState(
      from: from,
      to: to,
      sortBy: sortBy,
      sortOrder: sortOrder,
      textCategories:
          textCategory.isEmpty || !typeIncludes.contains(ClipItemType.text)
              ? null
              : textCategory,
      typeIncludes: typeIncludes.isEmpty || typeIncludes.length == 4
          ? null
          : typeIncludes,
    );
    context.pop(searchState);
  }

  void setSortOrder(Set<SortOrder> order) {
    setState(() => sortOrder = order.first);
  }

  void selectSortBy(ClipboardSortKey? sortKey) {
    if (sortKey == null) return;
    setState(() => sortBy = sortKey);
  }
}
