import 'package:clipboard/constants/strings/asset_constants.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoCollectionAvailable extends StatelessWidget {
  const NoCollectionAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AssetConstants.collection,
            width: 250,
          ),
          height20,
          Text(
            context.locale.noCollectionFound,
            style: textTheme.bodyLarge,
          ),
          height12,
          TextButton.icon(
            onPressed: () {
              context.goNamed(
                RouteConstants.createEditCollection,
                pathParameters: {
                  "id": "new",
                },
              );
            },
            icon: const Icon(Icons.library_add),
            label: Text(context.locale.createCollection),
          ),
        ],
      ),
    );
  }
}
