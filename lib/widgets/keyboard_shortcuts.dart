import 'package:copycat_base/common/logging.dart';
import 'package:flutter/widgets.dart';

class LoggingActionDispatcher extends ActionDispatcher {
  @override
  Object? invokeAction(
    covariant Action<Intent> action,
    covariant Intent intent, [
    BuildContext? context,
  ]) {
    logger.d('Action invoked: $action($intent) from $context');
    super.invokeAction(action, intent, context);

    return null;
  }
}

class KeyboardShortcuts extends StatelessWidget {
  final Map<ShortcutActivator, Intent> shortcuts;
  final Map<Type, Action<Intent>> actions;
  final Widget child;

  const KeyboardShortcuts({
    super.key,
    required this.shortcuts,
    required this.actions,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: shortcuts,
      child: Actions(
        dispatcher: LoggingActionDispatcher(),
        actions: actions,
        child: child,
      ),
    );
  }
}
