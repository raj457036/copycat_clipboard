import 'package:atom_event_bus/atom_event_bus.dart';
import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/utils/clipboard_actions.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:clipboard/widgets/keyboard_shortcuts.dart';
import 'package:copycat_base/common/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_io/io.dart';

class HomePageIntent extends Intent {
  const HomePageIntent();
}

class SearchPageIntent extends Intent {
  const SearchPageIntent();
}

class CollectionPageIntent extends Intent {
  const CollectionPageIntent();
}

class PasteIntent extends Intent {
  const PasteIntent();
}

class RefreshIntent extends Intent {
  const RefreshIntent();
}

final homeKeySet = LogicalKeySet(
  Platform.isMacOS ? LogicalKeyboardKey.meta : LogicalKeyboardKey.control,
  LogicalKeyboardKey.keyD,
);

final searchKeySet = LogicalKeySet(
  Platform.isMacOS ? LogicalKeyboardKey.meta : LogicalKeyboardKey.control,
  LogicalKeyboardKey.keyF,
);

final collectionKeySet = LogicalKeySet(
  Platform.isMacOS ? LogicalKeyboardKey.meta : LogicalKeyboardKey.control,
  LogicalKeyboardKey.keyC,
);

final pasteKeySet = LogicalKeySet(
  Platform.isMacOS ? LogicalKeyboardKey.meta : LogicalKeyboardKey.control,
  LogicalKeyboardKey.keyV,
);

final syncKeySet = LogicalKeySet(
  Platform.isMacOS ? LogicalKeyboardKey.meta : LogicalKeyboardKey.control,
  LogicalKeyboardKey.keyR,
);

class KeyboardShortcutProvider extends StatelessWidget {
  final Widget child;
  final int activePageIndex;
  const KeyboardShortcutProvider({
    super.key,
    required this.child,
    this.activePageIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return KeyboardShortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        searchKeySet: const SearchPageIntent(),
        homeKeySet: const HomePageIntent(),
        collectionKeySet: const CollectionPageIntent(),
        if (activePageIndex == 0) pasteKeySet: const PasteIntent(),
        if (activePageIndex != 3) syncKeySet: const RefreshIntent(),
      },
      actions: {
        HomePageIntent: CallbackAction<HomePageIntent>(
          onInvoke: (intent) {
            final isHomePage = activePageIndex == 0;
            if (!isHomePage) {
              context.goNamed(RouteConstants.home);
            }
            return null;
          },
        ),
        SearchPageIntent: CallbackAction<SearchPageIntent>(
          onInvoke: (intent) {
            final isSearchPage = activePageIndex == 1;
            if (isSearchPage) {
              EventBus.emit(searchFocusEvent.createPayload(null));
            } else {
              context.goNamed(RouteConstants.search);
            }
            return null;
          },
        ),
        CollectionPageIntent: CallbackAction<CollectionPageIntent>(
          onInvoke: (intent) {
            final isCollectionPage = activePageIndex == 2;
            if (!isCollectionPage) {
              context.goNamed(RouteConstants.collections);
            }
            return null;
          },
        ),
        PasteIntent: CallbackAction<PasteIntent>(
          onInvoke: (intent) {
            final isHomePage = activePageIndex == 0;
            if (isHomePage) {
              pasteContent(context);
            }
            return null;
          },
        ),
        RefreshIntent: CallbackAction<RefreshIntent>(
          onInvoke: (intent) async {
            final cubit = context.read<SyncManagerCubit>();
            final failure = await cubit.syncChanges(force: true);

            if (failure != null) {
              showFailureSnackbar(failure);
            }
            return null;
          },
        ),
      },
      child: child,
    );
  }
}
