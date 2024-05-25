import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:clipboard/widgets/sync_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void onNavItemTapped(BuildContext context, int index) {
  switch (index) {
    case 0:
      context.goNamed(RouteConstants.home);
      break;
    case 1:
      context.goNamed(RouteConstants.search);
      break;
    case 2:
      context.goNamed(RouteConstants.collections);
      break;
    case 3:
      context.goNamed(RouteConstants.settings);
      break;
    default:
  }
}

Widget? getFloatingActionButton(BuildContext context, int navbarActiveIndex,
    {bool isMobile = false}) {
  if (navbarActiveIndex == 0) {
    final actions = [
      FloatingActionButton(
        onPressed: () async {
          showTextSnackbar("Pasting to clipboard",
              isLoading: true, closePrevious: true);
          await context.read<OfflinePersistanceCubit>().paste();
          showTextSnackbar("Paste success", closePrevious: true);
        },
        tooltip: 'Paste',
        heroTag: "paste-fab",
        child: const Icon(Icons.content_paste_go_rounded),
      ),
      height8,
      const SyncStatusButton()
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: isMobile ? actions.reversed.toList() : actions,
    );
  }
  if (navbarActiveIndex == 2) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: "collection-fab",
          onPressed: () {
            context.goNamed(
              RouteConstants.createEditCollection,
              pathParameters: {
                "id": "new",
              },
            );
          },
          tooltip: "Create a collection",
          child: const Icon(Icons.library_add_rounded),
        )
      ],
    );
  }
  return null;
}
