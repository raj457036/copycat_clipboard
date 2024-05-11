import 'package:atom_event_bus/atom_event_bus.dart';
import 'package:clipboard/widgets/keyboard_shortcuts.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

final searchFocusEvent = Event<void>("SEARCH_FOCUS");

class SearchFocusIntent extends Intent {
  const SearchFocusIntent();
}

class SearchFoucsKeyboardShortcut extends StatelessWidget {
  final Widget child;

  const SearchFoucsKeyboardShortcut({
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
        ): const SearchFocusIntent(),
      },
      actions: {
        SearchFocusIntent: CallbackAction<SearchFocusIntent>(
          onInvoke: (intent) =>
              EventBus.emit(searchFocusEvent.createPayload(null)),
        ),
      },
      child: child,
    );
  }
}
