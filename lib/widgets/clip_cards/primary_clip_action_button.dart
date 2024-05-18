import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/clipboard_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrimaryClipActionButton extends StatelessWidget {
  final ClipboardItem item;
  const PrimaryClipActionButton({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppConfigCubit, AppConfigState, bool>(
      selector: (state) {
        return state.config.lastFocusedWindowId != null &&
            state.config.smartPaste;
      },
      builder: (context, hasFocusForPaste) {
        if (hasFocusForPaste) {
          return IconButton(
            icon: const Icon(Icons.paste),
            onPressed: () async {
              await copyToClipboard(context, item, noAck: true);
              await Future.delayed(Durations.short2);
              // ignore: use_build_context_synchronously
              await unfocusAndPaste(context);
            },
            tooltip: "Paste",
            style: IconButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                ),
              ),
            ),
          );
        }
        return IconButton(
          icon: const Icon(Icons.copy),
          onPressed: () => copyToClipboard(context, item),
          tooltip: "Copy",
          style: IconButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
              ),
            ),
          ),
        );
      },
    );
  }
}
