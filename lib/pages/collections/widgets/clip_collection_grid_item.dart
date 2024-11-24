import 'package:clipboard/widgets/menu.dart';
import 'package:copycat_base/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:copycat_base/constants/strings/route_constants.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/clip_collection/clipcollection.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ClipCollectionGridItem extends StatelessWidget {
  final ClipCollection collection;
  final bool autoFocus;

  const ClipCollectionGridItem({
    super.key,
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
    final colors = context.colors;
    var selected = false;
    final selectedShape = RoundedRectangleBorder(
      side: BorderSide(
        color: colors.primary,
        width: 2.5,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
      borderRadius: radius12,
    );
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
      child: StatefulBuilder(builder: (context, setState) {
        return Card.outlined(
          shape: selected
              ? selectedShape
              : const RoundedRectangleBorder(borderRadius: radius12),
          child: InkWell(
            borderRadius: radius12,
            onSecondaryTapDown: (detail) {
              final position = detail.globalPosition;
              Menu.of(context).openPopupMenu(context, position);
            },
            onFocusChange: (isFocused) {
              setState(() => selected = isFocused);
            },
            autofocus: autoFocus,
            onLongPress: () => Menu.of(context).openOptionDialog(context),
            onTap: () => showDetail(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: padding12,
                vertical: padding6,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    collection.emoji,
                    style: textTheme.displaySmall,
                  ),
                  width16,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            collection.title,
                            maxLines: 1,
                            style: textTheme.titleMedium,
                          ),
                        ),
                        height6,
                        Flexible(
                          child: Text(
                            collection.description ??
                                context.locale.noDescription,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.bodyMedium?.apply(
                              color: context.colors.outline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
