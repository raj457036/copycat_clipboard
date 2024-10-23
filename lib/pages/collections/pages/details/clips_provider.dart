import 'package:copycat_base/bloc/collection_clips_cubit/collection_clips_cubit.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/widgets/clipcard_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef ClipProviderBuilder = Widget Function(
  BuildContext context,
  List<ClipboardItem> clips,
  bool hasMore,
  bool loading,
  VoidCallback loadMore,
);

class CollectionClipsProvider extends StatelessWidget {
  final ClipProviderBuilder builder;
  const CollectionClipsProvider({
    super.key,
    required this.builder,
  });

  Future<void> loadMore(BuildContext context) async {
    await context.read<CollectionClipsCubit>().search();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionClipsCubit, CollectionClipsState>(
      builder: (context, state) {
        switch (state) {
          case InitialCollectionClipsState() || SearchingCollectionClipsState():
            return const ClipcardLoading();
          case CollectionClipsErrorState(:final failure):
            return Center(
              child: Text(failure.message),
            );
          case CollectionClipsResultsState(:final results, :final hasMore):
            return builder(
              context,
              results,
              hasMore,
              false,
              () => loadMore(context),
            );
        }
      },
    );
  }
}
