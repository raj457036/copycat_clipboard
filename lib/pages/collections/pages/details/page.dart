import 'package:clipboard/bloc/collection_clips_cubit/collection_clips_cubit.dart';
import 'package:clipboard/constants/numbers/breakpoints.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clip_collection/clipcollection.dart';
import 'package:clipboard/widgets/clip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollectionDetailPage extends StatelessWidget {
  final ClipCollection collection;
  const CollectionDetailPage({
    super.key,
    required this.collection,
  });

  void loadMore(BuildContext context) {
    context.read<CollectionClipsCubit>().search(null);
  }

  @override
  Widget build(BuildContext context) {
    final title = "${collection.emoji} • ${collection.title}";
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<CollectionClipsCubit, CollectionClipsState>(
        builder: (context, state) {
          switch (state) {
            case InitialCollectionClipsState() ||
                  SearchingCollectionClipsState():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case CollectionClipsErrorState(:final failure):
              return Center(
                child: Text(failure.message),
              );
            case CollectionClipsResultsState(:final results, :final hasMore):
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
    );
  }
}
