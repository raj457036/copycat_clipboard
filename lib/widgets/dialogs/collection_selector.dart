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
import 'package:go_router/go_router.dart';

class ClipCollectionSelectionDialog extends StatelessWidget {
  final int? selectedCollectionId;
  const ClipCollectionSelectionDialog({
    super.key,
    this.selectedCollectionId,
  });

  Future<ClipCollection?> open(BuildContext context) async {
    return await showDialog<ClipCollection?>(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FittedBox(
              child: Text(context.locale.selectCollection),
            ),
            const DisableForLocalUser(
              ifLocal: CreateCollectionFAB(
                localMode: true,
                isFab: false,
              ),
              child: CreateCollectionFAB(isFab: false),
            ),
          ],
        ),
        content: this,
        insetPadding: const EdgeInsets.all(padding12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
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
                    selected: selectedCollectionId == collection.id,
                    selectedTileColor: colors.surfaceContainerHighest,
                    title: Text(collection.title),
                    subtitle: collection.description != null
                        ? Text(collection.description!)
                        : null,
                    onTap: () => context.pop(collection),
                  );
                },
              );
            }
        }
      }),
    );
  }
}
