import 'package:atom_event_bus/atom_event_bus.dart';
import 'package:clipboard/utils/clipboard_actions.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/keyboard_shortcuts.dart';
import 'package:clipboard/widgets/window_focus_manager.dart';
import 'package:copycat_base/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:copycat_base/common/events.dart';
import 'package:copycat_base/constants/strings/route_constants.dart';
import 'package:copycat_base/utils/snackbar.dart';
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

class SettingsPageIntent extends Intent {
  const SettingsPageIntent();
}

class PasteIntent extends Intent {
  const PasteIntent();
}

class RefreshIntent extends Intent {
  const RefreshIntent();
}

class HideWindowIntent extends Intent {
  const HideWindowIntent();
}

class EditClipboardItemIntent extends Intent {
  const EditClipboardItemIntent();
}

final homeKeySet = SingleActivator(
  LogicalKeyboardKey.keyD,
  meta: Platform.isMacOS,
  control: Platform.isWindows || Platform.isLinux,
  includeRepeats: false,
);

final searchKeySet = SingleActivator(
  LogicalKeyboardKey.keyF,
  meta: Platform.isMacOS,
  control: Platform.isWindows || Platform.isLinux,
  includeRepeats: false,
);

final collectionKeySet = SingleActivator(
  LogicalKeyboardKey.keyC,
  meta: Platform.isMacOS,
  control: Platform.isWindows || Platform.isLinux,
  includeRepeats: false,
);

final settingsKeySet = SingleActivator(
  LogicalKeyboardKey.keyX,
  meta: Platform.isMacOS,
  control: Platform.isWindows || Platform.isLinux,
  includeRepeats: false,
);

final pasteKeySet = SingleActivator(
  LogicalKeyboardKey.keyV,
  meta: Platform.isMacOS,
  control: Platform.isWindows || Platform.isLinux,
  includeRepeats: false,
);

final syncKeySet = SingleActivator(
  LogicalKeyboardKey.keyR,
  meta: Platform.isMacOS,
  control: Platform.isWindows || Platform.isLinux,
  includeRepeats: false,
);

const closeWindowKeySet = SingleActivator(LogicalKeyboardKey.escape);
// final editClipItemKeySet = SingleActivator(
//   LogicalKeyboardKey.keyE,
//   meta: Platform.isMacOS,
//   control: Platform.isWindows || Platform.isLinux,
//   includeRepeats: false,
// );

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
      shortcuts: <ShortcutActivator, Intent>{
        searchKeySet: const SearchPageIntent(),
        homeKeySet: const HomePageIntent(),
        collectionKeySet: const CollectionPageIntent(),
        settingsKeySet: const SettingsPageIntent(),
        // editClipItemKeySet: const EditClipboardItemIntent(),
        if (isDesktopPlatform) closeWindowKeySet: const HideWindowIntent(),
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
        SettingsPageIntent: CallbackAction<SettingsPageIntent>(
          onInvoke: (intent) {
            final isSettingsPage = activePageIndex == 3;
            if (!isSettingsPage) {
              context.goNamed(RouteConstants.settings);
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
        HideWindowIntent: CallbackAction<HideWindowIntent>(
          onInvoke: (intent) async {
            final router = GoRouter.maybeOf(context);
            if (router == null) return null;
            final canPop = router.canPop();
            if (!canPop) {
              WindowFocusManager.of(context)?.restore();
            } else {
              router.pop();
            }

            return null;
          },
        ),
        // EditClipboardItemIntent: CallbackAction<EditClipboardItemIntent>(
        //   onInvoke: (intent) async {
        //     final cubit = context.read<FocusedClipitemCubit>();

        //     switch (cubit.state) {
        //       case FocusedClipItem(:final item):
        //         await preview(context, item);
        //     }

        //     return null;
        //   },
        // ),
      },
      child: child,
    );
  }
}
