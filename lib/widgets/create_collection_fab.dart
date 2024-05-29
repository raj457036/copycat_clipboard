import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/db/subscription/subscription.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateCollectionFloatingActionButton extends StatelessWidget {
  const CreateCollectionFloatingActionButton({super.key});

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
        return BlocSelector<ClipCollectionCubit, ClipCollectionState, bool>(
          selector: (state) {
            if (state is ClipCollectionLoaded) {
              return subscription.collections > state.collections.length;
            }
            return false;
          },
          builder: (context, canCreate) {
            if (!canCreate) return const SizedBox.shrink();
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
              tooltip: "Create a collection",
              child: const Icon(Icons.library_add_rounded),
            );
          },
        );
      },
    );
  }
}
