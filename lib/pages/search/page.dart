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

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(width <= 400 ? 80 : 100),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(padding16),
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
      body: BlocBuilder<SearchCubit, SearchState>(
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
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    crossAxisSpacing: padding6,
                    mainAxisSpacing: padding6,
                    childAspectRatio: 1,
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
                      deleteAllowed: false,
                    );
                  },
                );
              }
          }
        },
      ),
    );
  }
}
