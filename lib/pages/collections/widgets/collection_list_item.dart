import 'package:clipboard/widgets/menu.dart';
import 'package:copycat_base/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:copycat_base/constants/strings/route_constants.dart';
import 'package:copycat_base/db/clip_collection/clipcollection.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ClipCollectionListItem extends StatelessWidget {
  final ClipCollection collection;
  final ShapeBorder? shape;
  final bool autoFocus;

  const ClipCollectionListItem({
    super.key,
    this.shape,
    this.autoFocus = false,
    required this.collection,
  });

  void edit(BuildContext context) {
    context.goNamed(
      RouteConstants.createEditCollection,
      pathParameters: {
        "id": collection.id.toString(),
      },
    );
  }

  Future<void> delete(BuildContext context) async {
    context.read<ClipCollectionCubit>().delete(collection);
  }

  void showDetail(BuildContext context) {
    context.goNamed(
      RouteConstants.collectionDetail,
      pathParameters: {
        "id": collection.id.toString(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Menu(
      items: [
        MenuItem(
          icon: Icons.edit,
          text: context.locale.edit,
          onPressed: () => edit(context),
        ),
        const MenuItem(type: MenuItemType.divider),
        MenuItem(
          icon: Icons.delete,
          text: context.locale.delete,
          onPressed: () => delete(context),
        ),
      ],
      child: Builder(builder: (context) {
        return GestureDetector(
          onSecondaryTapDown: (detail) {
            final position = detail.globalPosition;
            Menu.of(context).openPopupMenu(context, position);
          },
          child: ListTile(
            shape: shape,
            autofocus: autoFocus,
            leading: Text(
              collection.emoji,
              style: textTheme.headlineMedium,
            ),
            title: Text(collection.title, maxLines: 1),
            titleTextStyle: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            subtitle: Text(
              collection.description ?? context.locale.noDescription,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            isThreeLine: true,
            titleAlignment: ListTileTitleAlignment.center,
            trailing: const Icon(Icons.chevron_right),
            onLongPress: () => Menu.of(context).openOptionDialog(context),
            onTap: () => showDetail(context),
          ),
        );
      }),
    );
  }
}
