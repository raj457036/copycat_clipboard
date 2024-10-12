import 'package:atom_event_bus/atom_event_bus.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/search/filter_button.dart';
import 'package:clipboard/widgets/search/filter_dialog.dart';
import 'package:copycat_base/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:copycat_base/common/events.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_io/io.dart';

final searchKeySet = SingleActivator(
  LogicalKeyboardKey.keyF,
  meta: Platform.isMacOS,
  control: Platform.isWindows || Platform.isLinux,
  includeRepeats: false,
);

class SearchIntent extends Intent {}

class SearchInputBar extends StatefulWidget {
  const SearchInputBar({super.key});

  @override
  State<SearchInputBar> createState() => _SearchBarStInputate();
}

class _SearchBarStInputate extends State<SearchInputBar> {
  SearchFilterState? filterState;
  late final TextEditingController queryController;
  EventRule? focusEventRule;
  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    queryController = TextEditingController();
    if (isDesktopPlatform) {
      focusEventRule = EventRule<void>(searchFocusEvent, targets: [
        EventListener((_) => focusNode.requestFocus()),
      ]);
    }
    focusNode = FocusNode(debugLabel: "Search Bar Focus");
  }

  @override
  void dispose() {
    queryController.dispose();
    focusEventRule?.cancel();
    focusNode.dispose();
    super.dispose();
  }

  bool get isActive =>
      queryController.text != "" ||
      (filterState != null && filterState!.isActive);

  void focus() {
    focusNode.requestFocus();
  }

  Future<void> search(String text) async {
    setState(() {});
    await context.read<ClipboardCubit>().fetch(
          query: text,
          fromTop: true,
        );
  }

  void onFilterChange(SearchFilterState? filterState) {
    setState(() {
      this.filterState = filterState;
    });
    final searchCubit = context.read<ClipboardCubit>();
    searchCubit.fetch(
      query: queryController.text,
      from: filterState?.from,
      to: filterState?.to,
      sortBy: filterState?.sortBy,
      order: filterState?.sortOrder,
      textCategories: filterState?.textCategories,
      clipTypes: filterState?.typeIncludes,
      fromTop: true,
    );
  }

  void clear() {
    setState(() {
      queryController.clear();
      filterState = const SearchFilterState();
    });
    onFilterChange(null);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    final size = context.mq.size;

    return Focus(
      descendantsAreTraversable: false,
      skipTraversal: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: padding8),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 40,
            minWidth: 200,
            maxWidth: 450,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: SearchBar(
                  controller: queryController,
                  focusNode: focusNode,
                  onTapOutside: (event) =>
                      FocusManager.instance.primaryFocus?.nextFocus(),
                  elevation: 0.0.msp,
                  padding: const EdgeInsets.only(left: padding12).msp,
                  leading: const Icon(Icons.search_rounded),
                  hintText: context.locale.searchInClipboard,
                  trailing: [
                    if (isDesktopPlatform)
                      Padding(
                        padding: const EdgeInsets.only(right: padding10),
                        child: Text(
                          "$metaKey + F",
                          style: textTheme.labelLarge?.copyWith(
                            color: colors.outline,
                          ),
                        ),
                      ),
                    if (isActive)
                      IconButton(
                        onPressed: clear,
                        icon: const Icon(Icons.clear_rounded),
                        color: colors.outline,
                        tooltip: "Reset Search",
                      ),
                  ],
                  textInputAction: TextInputAction.search,
                  onSubmitted: search,
                ),
              ),
              if (size.width > 300) width8,
              if (size.width > 300)
                FilterButton(
                  size: 35,
                  onChange: onFilterChange,
                  initialState: filterState ?? const SearchFilterState(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
