import 'package:clipboard/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clip_collection/clipcollection.dart';
import 'package:clipboard/widgets/dialogs/collection_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClipCollectionSelectorTile extends StatefulWidget {
  final int? collectionId;
  final bool removalAllowed;
  final void Function(ClipCollection? collection, {bool removed}) onChange;

  const ClipCollectionSelectorTile({
    super.key,
    this.collectionId,
    this.removalAllowed = true,
    required this.onChange,
  });

  @override
  State<ClipCollectionSelectorTile> createState() =>
      ClipCollectionSelectorStateTile();
}

class ClipCollectionSelectorStateTile
    extends State<ClipCollectionSelectorTile> {
  late final ClipCollectionCubit cubit;
  bool isLoading = false;
  ClipCollection? collection;

  @override
  void initState() {
    super.initState();
    cubit = context.read<ClipCollectionCubit>();
    fetchCollection();
  }

  Future<void> fetchCollection() async {
    setState(() {
      isLoading = true;
    });
    if (widget.collectionId != null) {
      collection = await cubit.get(widget.collectionId!);
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> selectCollection() async {
    final selected = await const ClipCollectionSelectionDialog().open(context);

    if (selected == null) return;
    setState(() {
      collection = selected;
    });
    widget.onChange(selected, removed: false);
  }

  void clear() {
    setState(() {
      collection = null;
    });
    widget.onChange(null, removed: true);
  }

  @override
  Widget build(BuildContext context) {
    final tile = ListTile(
      title: collection == null
          ? const Text("No Collection")
          : Text(collection!.title),
      subtitle: collection == null
          ? const Text("Choose a Collection")
          : const Text("Change Collection"),
      leading: const Icon(Icons.library_add),
      trailing: const Icon(Icons.chevron_right),
      shape: const RoundedRectangleBorder(borderRadius: radius8),
      onTap: isLoading ? null : selectCollection,
    );

    if (widget.removalAllowed) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: tile),
          if (collection != null)
            Padding(
              padding: const EdgeInsets.only(left: padding12),
              child: IconButton.filledTonal(
                onPressed: clear,
                icon: const Icon(
                  Icons.remove_circle,
                ),
                tooltip: "Remove from collection",
              ),
            ),
        ],
      );
    }

    return tile;
  }
}