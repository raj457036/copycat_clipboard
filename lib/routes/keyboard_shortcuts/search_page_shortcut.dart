import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/widgets/keyboard_shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

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
    return KeyboardShortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(
          LogicalKeyboardKey.meta,
          LogicalKeyboardKey.keyF,
        ): const SearchPageIntent(),
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
