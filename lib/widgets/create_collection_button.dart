import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/db/subscription/subscription.dart';
import 'package:clipboard/pages/collections/widgets/dialogs/create_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateCollectionButton extends StatelessWidget {
  final bool isFab;
  const CreateCollectionButton({
    super.key,
    this.isFab = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthCubit, AuthState, Subscription>(
      selector: (state) {
        if (state is AuthenticatedAuthState) {
          return state.subscription!;
        }
        return Subscription.free("");
      },
      builder: (context, subscription) {
        return BlocSelector<ClipCollectionCubit, ClipCollectionState,
            (int, int)>(
          selector: (state) {
            if (state is ClipCollectionLoaded) {
              return (subscription.collections, state.collections.length);
            }
            return (subscription.collections, 0);
          },
          builder: (context, state) {
            final (collection, count) = state;
            final canCreate = collection > count;
            if (!canCreate) return const SizedBox.shrink();
            final remaining = collection - count;
            if (!isFab) {
              return IconButton.filledTonal(
                onPressed: () => showCreateCollectionDialog(context),
                icon: const Icon(Icons.add),
                tooltip: "Create a collection ( $remaining left )",
              );
            }
            return FloatingActionButton(
              heroTag: "collection-fab",
              onPressed: canCreate
                  ? () {
                      context.goNamed(
                        RouteConstants.createEditCollection,
                        pathParameters: {
                          "id": "new",
                        },
                      );
                    }
                  : null,
              tooltip: "Create a collection ( $remaining left )",
              child: const Icon(Icons.library_add_rounded),
            );
          },
        );
      },
    );
  }
}
