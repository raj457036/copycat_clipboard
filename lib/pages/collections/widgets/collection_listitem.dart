import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/db/clip_collection/clipcollection.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ClipCollectionListItem extends StatelessWidget {
  final ClipCollection collection;
  final ShapeBorder? shape;

  const ClipCollectionListItem({
    super.key,
    this.shape,
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
          icon: Icons.delete,
          text: 'Edit',
          onPressed: () => edit(context),
        )
      ],
      child: ListTile(
        shape: shape,
        leading: Text(
          collection.emoji,
          style: textTheme.headlineMedium,
        ),
        title: Text(collection.title, maxLines: 1),
        titleTextStyle: textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        subtitle: Text(
          collection.description ?? "No Description",
          maxLines: 1,
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => showDetail(context),
      ),
    );
  }
}
