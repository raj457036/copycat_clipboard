import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/bloc/search_cubit/search_cubit.dart';
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
    final isMobile = width <= 576;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(width <= 576 ? 65 : 100),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: padding16,
                right: padding16,
                top: padding38,
              ),
              child: SearchBar(
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
          )),
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
                  child: Text("Search something in your clipboard."),
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
                      child: Text("No clipboard item found for the query!"),
                    );
                  }

                  final hasMoreResult = hasMore ? 1 : 0;

                  return GridView.builder(
                    padding: const EdgeInsets.all(padding16),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250,
                      crossAxisSpacing: padding6,
                      mainAxisSpacing: padding6,
                      childAspectRatio: isMobile ? 3 / 4 : 1,
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
