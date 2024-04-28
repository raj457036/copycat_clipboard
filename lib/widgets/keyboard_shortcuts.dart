import 'package:clipboard/common/logging.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

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

class SearchPageIntent extends Intent {
  const SearchPageIntent();
}

class KeyboardShortcuts extends StatelessWidget {
  final Widget child;
  const KeyboardShortcuts({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(
          LogicalKeyboardKey.meta,
          LogicalKeyboardKey.keyF,
        ): const SearchPageIntent(),
      },
      child: Actions(
        dispatcher: LoggingActionDispatcher(),
        actions: {
          SearchPageIntent: CallbackAction<SearchPageIntent>(
            onInvoke: (intent) => context.goNamed(RouteConstants.search),
          ),
        },
        child: child,
      ),
    );
  }
}
