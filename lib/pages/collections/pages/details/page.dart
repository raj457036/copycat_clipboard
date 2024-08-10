import 'package:clipboard/widgets/can_paste_builder.dart';
import 'package:clipboard/widgets/clip_card.dart';
import 'package:clipboard/widgets/load_more_card.dart';
import 'package:clipboard/widgets/scaffold_body.dart';
import 'package:copycat_base/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:copycat_base/bloc/collection_clips_cubit/collection_clips_cubit.dart';
import 'package:copycat_base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/clip_collection/clipcollection.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/snackbar.dart';
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
    return MultiBlocListener(
      listeners: [
        BlocListener<OfflinePersistanceCubit, OfflinePersistanceState>(
          listenWhen: (previous, current) {
            switch (current) {
              case OfflinePersistanceDeleted() || OfflinePersistanceSaved():
                return true;
              case _:
                return false;
            }
          },
          listener: (context, state) {
            switch (state) {
              case OfflinePersistanceDeleted(:final item):
                context.read<CollectionClipsCubit>().deleteItem(item);
                break;
              case OfflinePersistanceSaved(:final item):
                context.read<CollectionClipsCubit>().put(item);
                break;
              case _:
            }
          },
        ),
        BlocListener<CloudPersistanceCubit, CloudPersistanceState>(
            listener: (context, state) {
          switch (state) {
            case CloudPersistanceUploadingFile(:final item) ||
                  CloudPersistanceDownloadingFile(:final item):
              context.read<CollectionClipsCubit>().put(item);
              break;
            case CloudPersistanceError(:final failure, :final item):
              showFailureSnackbar(failure);
              context.read<CollectionClipsCubit>().put(item);
              break;
          }
        }),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ScaffoldBody(
          margin: const EdgeInsets.only(
            right: padding12,
          ),
          child: BlocBuilder<CollectionClipsCubit, CollectionClipsState>(
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
                case CollectionClipsResultsState(
                    :final results,
                    :final hasMore
                  ):
                  {
                    if (results.isEmpty) {
                      return Center(
                        child: Text(context.locale.noResultsWereFound),
                      );
                    }

                    final hasMoreResult = hasMore ? 1 : 0;

                    return CanPasteBuilder(builder: (context, canPaste) {
                      return GridView.builder(
                        primary: true,
                        padding: isMobile ? insetLRB16 : insetAll16,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250,
                          childAspectRatio: isMobile ? 2 / 3 : 1,
                          mainAxisSpacing: padding8,
                          crossAxisSpacing: padding8,
                        ),
                        itemCount: results.length + hasMoreResult,
                        itemBuilder: (context, index) {
                          if (index == results.length) {
                            return LoadMoreCard(loadMore: loadMore);
                          }

                          final item = results[index];
                          return ClipCard(
                            key: ValueKey("clipboard-item-//${item.id}"),
                            item: item,
                            autoFocus: index == 0,
                            canPaste: canPaste,
                          );
                        },
                      );
                    });
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}
