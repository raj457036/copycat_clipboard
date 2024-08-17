import 'package:clipboard/pages/search/widgets/filter_dialog.dart';
import 'package:copycat_base/bloc/search_cubit/search_cubit.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterButton extends StatelessWidget {
  final TextEditingController queryController;
  final FocusNode focusNode;
  const FilterButton({
    super.key,
    required this.queryController,
    required this.focusNode,
  });

  Future<void> changeFilter(
      BuildContext context, SearchFilterState state) async {
    final newState = await FilterDialog(state: state).open(context);
    if (newState == null) return;
    if (context.mounted) {
      final searchCubit = context.read<SearchCubit>();

      searchCubit.search(
        queryController.text,
        from: newState.from,
        to: newState.to,
        sortBy: newState.sortBy,
        order: newState.sortOrder,
        textCategories: newState.textCategories,
        clipTypes: newState.typeIncludes,
        force: true,
        keepStateFilters: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocSelector<SearchCubit, SearchState, SearchFilterState>(
      selector: (state) {
        switch (state) {
          case SearchingState(
                  :final textCategories,
                  :final types,
                  :final sortBy,
                  :final order,
                  :final from,
                  :final to,
                ) ||
                SearchResultState(
                  :final textCategories,
                  :final types,
                  :final sortBy,
                  :final order,
                  :final from,
                  :final to,
                ):
            return SearchFilterState(
              from: from,
              to: to,
              sortBy: sortBy,
              sortOrder: order,
              textCategories: textCategories,
              typeIncludes: types,
            );
          case _:
            return const SearchFilterState();
        }
      },
      builder: (context, state) {
        return IconButton(
          icon: const Icon(Icons.tune_rounded),
          tooltip: "Apply Filters",
          focusNode: focusNode,
          color: state.isActive ? colors.primaryContainer : null,
          style: IconButton.styleFrom(
            backgroundColor: state.isActive ? colors.primary : null,
          ),
          onPressed: () => changeFilter(context, state),
        );
      },
    );
  }
}
