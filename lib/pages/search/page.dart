import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/bloc/search_cubit/search_cubit.dart';
import 'package:clipboard/constants/numbers/breakpoints.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/widgets/clip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  void loadMore(BuildContext context) {
    context.read<SearchCubit>().search(null);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + (isMobile ? 15 : 30),
        centerTitle: true,
        title: SearchBar(
          elevation: 1.0.msp,
          padding: const EdgeInsets.symmetric(horizontal: padding16).msp,
          leading: const Icon(Icons.search_rounded),
          hintText: "Search in clipboard",
          autoFocus: true,
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            context.read<SearchCubit>().search(value);
          },
        ),
      ),
      body: BlocListener<OfflinePersistanceCubit, OfflinePersistanceState>(
        listenWhen: (previous, current) => current is OfflinePersistanceDeleted,
        listener: (context, state) {
          switch (state) {
            case OfflinePersistanceDeleted(:final item):
              context.read<SearchCubit>().deleteItem(item);
            case _:
          }
        },
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            switch (state) {
              case InitialSearchState():
                return const Center(
                  child: Text("Search in clipboard"),
                );
              case SearchingState():
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case SearchErrorState(:final failure):
                return Center(
                  child: Text(failure.message),
                );
              case SearchResultState(:final results, :final hasMore):
                {
                  if (results.isEmpty) {
                    return const Center(
                      child: Text("No results were found."),
                    );
                  }

                  final hasMoreResult = hasMore ? 1 : 0;

                  return GridView.builder(
                    padding: isMobile ? insetLTR16 : insetAll16,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250,
                      crossAxisSpacing: padding8,
                      mainAxisSpacing: padding8,
                      childAspectRatio: isMobile ? 2 / 3 : 1,
                    ),
                    itemCount: results.length + hasMoreResult,
                    itemBuilder: (context, index) {
                      if (index == results.length) {
                        return Card.outlined(
                          child: Center(
                            child: TextButton.icon(
                              onPressed: () => loadMore(context),
                              label: const Text(
                                "Load More",
                              ),
                              icon: const Icon(Icons.read_more),
                            ),
                          ),
                        );
                      }

                      final item = results[index];
                      return ClipCard(
                        key: ValueKey("clipboard-item-${item.id}"),
                        item: item,
                        // deleteAllowed: false,
                      );
                    },
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
