import 'package:clipboard/widgets/fabs/create_collection.dart';
import 'package:clipboard/widgets/local_user.dart';
import 'package:clipboard/widgets/no_collection.dart';
import 'package:copycat_base/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/clip_collection/clipcollection.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClipCollectionSelectionDialog extends StatelessWidget {
  final int? selectedCollectionId;
  const ClipCollectionSelectionDialog({
    super.key,
    this.selectedCollectionId,
  });

  Future<ClipCollection?> open(BuildContext context) async {
    return await showDialog<ClipCollection?>(
      context: context,
      builder: (context) {
        final isDense = context.mq.size.shortestSide < dockedLRMaxWidth;
        return AlertDialog(
          title: ListTile(
            dense: isDense,
            title: Text(context.locale.selectCollection),
            subtitle: Text(context.locale.selectCollectionSub),
            trailing: const DisableForLocalUser(
              ifLocal: CreateCollectionButton(
                localMode: true,
                isFab: false,
              ),
              child: CreateCollectionButton(isFab: false),
            ),
            contentPadding: isDense ? const EdgeInsets.all(padding10) : null,
          ),
          titlePadding: isDense ? EdgeInsets.zero : null,
          content: this,
          contentPadding:
              isDense ? const EdgeInsets.only(bottom: padding10) : null,
          insetPadding: const EdgeInsets.all(padding12),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    final isDense = context.mq.size.shortestSide < dockedLRMaxWidth;
    final isVeryDense = context.mq.size.shortestSide < 250;
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(
        width: 550,
        height: 550,
      ),
      child: BlocBuilder<ClipCollectionCubit, ClipCollectionState>(
          builder: (context, state) {
        switch (state) {
          case ClipCollectionInitial():
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ClipCollectionError(:final failure):
            return Center(
              child: Text(failure.message),
            );
          case ClipCollectionLoaded(:final collections):
            {
              if (collections.isEmpty) {
                return const NoCollectionAvailable(dialogMode: true);
              }
              return ListView.builder(
                itemCount: collections.length,
                itemBuilder: (context, index) {
                  final collection = collections[index];

                  return ListTile(
                    leading: Text(
                      collection.emoji,
                      style: textTheme.titleLarge,
                    ),
                    dense: isDense,
                    selected: selectedCollectionId == collection.id,
                    selectedTileColor: colors.surfaceContainerHighest,
                    title: Text(collection.title),
                    subtitle: !isVeryDense && collection.description != null
                        ? Text(collection.description!)
                        : null,
                    onTap: () => Navigator.pop(context, collection),
                  );
                },
              );
            }
        }
      }),
    );
  }
}
