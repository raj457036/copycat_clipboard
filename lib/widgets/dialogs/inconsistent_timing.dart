import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/constants/key.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:window_manager/window_manager.dart';

bool _visible = false;

class InconsistentTiming extends StatelessWidget {
  const InconsistentTiming({super.key});

  Future<void> open() async {
    if (_visible) return;
    await Future.delayed(const Duration(seconds: 5));
    windowManager
      ..show()
      ..focus();
    _visible = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showAdaptiveDialog(
        context: rootNavKey.currentContext!,
        barrierDismissible: false,
        routeSettings: const RouteSettings(
          name: "Inconsistent-Time",
        ),
        builder: (context) {
          return this;
        },
      );
    });
  }

  Future<void> checkAgain(BuildContext context) async {
    final cubit = context.read<AppConfigCubit>();
    final result = await cubit.syncClocks();
    if (result == true && context.mounted) {
      context.pop();
      _visible = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(context.locale.timeSyncWarning, textAlign: TextAlign.center),
      content: SizedBox(
        width: 250,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            height12,
            Text(
              context.locale.timeSyncWarningNote1,
              textAlign: TextAlign.center,
            ),
            height10,
            Text(
              context.locale.timeSyncWarningNote2,
              textAlign: TextAlign.center,
            ),
            height10,
            Text(
              context.locale.timeSyncWarningNote3,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => checkAgain(context),
          child: Text(context.locale.checkAgain),
        ),
      ],
    );
  }
}
