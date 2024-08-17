import 'dart:math' show max;

import 'package:clipboard/pages/collections/widgets/dialogs/create_collection.dart';
import 'package:clipboard/widgets/badges.dart';
import 'package:clipboard/widgets/subscription/subscription_provider.dart';
import 'package:copycat_base/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:copycat_base/constants/numbers/values.dart';
import 'package:copycat_base/constants/strings/route_constants.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateCollectionFAB extends StatelessWidget {
  final bool isFab;
  final bool localMode;
  const CreateCollectionFAB({
    super.key,
    this.isFab = true,
    this.localMode = false,
  });

  void createCollection(BuildContext context) {
    context.goNamed(
      RouteConstants.createEditCollection,
      pathParameters: {
        "id": "new",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SubscriptionBuilder(
      builder: (context, subscription) {
        return BlocSelector<ClipCollectionCubit, ClipCollectionState,
            (int, int)>(
          selector: (state) {
            if (state is ClipCollectionLoaded) {
              return (
                subscription?.collections ?? defaultCollectionCount,
                state.collections.length
              );
            }
            return (subscription?.collections ?? defaultCollectionCount, 0);
          },
          builder: (context, state) {
            final (collection, count) = state;
            final canCreate = localMode || collection > count;
            final remaining =
                localMode ? "∞" : max(collection - count, 0).toString();
            if (!isFab) {
              if (!canCreate) return const SizedBox.shrink();
              return IconButton.filledTonal(
                onPressed: () => showCreateCollectionDialog(context),
                icon: const Icon(Icons.add),
                tooltip: context.locale.createACollection(remaining),
              );
            }
            Widget child = FloatingActionButton(
              heroTag: "collection-fab",
              backgroundColor: canCreate ? null : colors.outline,
              mouseCursor: canCreate ? null : SystemMouseCursors.forbidden,
              onPressed: canCreate ? () => createCollection(context) : null,
              tooltip: context.locale.createACollection(remaining),
              child: const Icon(Icons.library_add_rounded),
            );

            if (!canCreate) {
              child = Stack(
                clipBehavior: Clip.none,
                children: [
                  child,
                  const Positioned(
                    bottom: -10,
                    left: 0,
                    right: 0,
                    child: ProBadge(noTooltip: true),
                  ),
                ],
              );
            }

            return child;
          },
        );
      },
    );
  }
}
