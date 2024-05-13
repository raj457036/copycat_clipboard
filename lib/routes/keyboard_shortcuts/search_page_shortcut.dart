import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/widgets/keyboard_shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_io/io.dart';

class SearchPageIntent extends Intent {
  const SearchPageIntent();
}

class SearchPageShortcut extends StatelessWidget {
  final Widget child;
  const SearchPageShortcut({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    LogicalKeySet keyset;

    if (Platform.isMacOS) {
      keyset = LogicalKeySet(
        LogicalKeyboardKey.meta,
        LogicalKeyboardKey.keyF,
      );
    } else {
      keyset = LogicalKeySet(
        LogicalKeyboardKey.control,
        LogicalKeyboardKey.keyF,
      );
    }
    return KeyboardShortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        keyset: const SearchPageIntent(),
      },
      actions: {
        SearchPageIntent: CallbackAction<SearchPageIntent>(
          onInvoke: (intent) => context.goNamed(RouteConstants.search),
        ),
      },
      child: child,
    );
  }
}
