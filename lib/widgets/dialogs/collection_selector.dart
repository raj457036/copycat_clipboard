import 'package:clipboard/widgets/create_collection_button.dart';
import 'package:clipboard/widgets/local_user.dart';
import 'package:clipboard/widgets/no_collection.dart';
import 'package:copycat_base/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:copycat_base/db/clip_collection/clipcollection.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClipCollectionSelectionDialog extends StatelessWidget {
  const ClipCollectionSelectionDialog({super.key});

  Future<ClipCollection?> open(BuildContext context) async {
    return await showDialog<ClipCollection?>(
      context: context,
      builder: (context) => SimpleDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(context.locale.selectCollection),
            const DisableForLocalUser(
              ifLocal: CreateCollectionButton(
                localMode: true,
                isFab: false,
              ),
              child: CreateCollectionButton(isFab: false),
            ),
          ],
        ),
        children: [this],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
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
                return const NoCollectionAvailable();
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
                    title: Text(collection.title),
                    subtitle: collection.description != null
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
