import 'package:clipboard/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:clipboard/widgets/dialogs/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_filex/open_filex.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> copyToClipboard(
  BuildContext context,
  ClipboardItem item, {
  bool saveFile = false,
}) async {
  try {
    final result =
        await context.read<OfflinePersistanceCubit>().copyToClipboard(
              item,
              saveFile: saveFile,
            );
    if (result) {
      showTextSnackbar("Copied");
    } else {
      showTextSnackbar("⚠️ Copy failed or cancelled");
    }
  } catch (e) {
    showTextSnackbar("⭕️ Failed to copy. Something went wrong!");
  }
}

Future<void> shareClipboardItem(
    BuildContext context, ClipboardItem item) async {
  context
      .read<OfflinePersistanceCubit>()
      .shareClipboardItem(item)
      .then((value) {
    showTextSnackbar(
      "📝 Successfully shared",
    );
  }).catchError((_) {
    showTextSnackbar("❌ Failed to share");
  });
}

Future<void> downloadFile(
  BuildContext context,
  ClipboardItem item,
) async {
  context.read<CloudPersistanceCubit>().download(item);
}

Future<void> launchUrl(ClipboardItem item) async {
  if (item.url != null && Uri.tryParse(item.url!) != null) {
    await launchUrlString(item.url!);
  }
}

Future<bool> deleteItem(BuildContext context, ClipboardItem item) async {
  final confirmation = await const ConfirmDialog(
    title: "Delete Item",
    message: "Are you sure to delete this item?",
  ).open(context);

  if (!confirmation) return false;

  // ignore: use_build_context_synchronously
  await context.read<CloudPersistanceCubit>().delete(item);
  return true;
}

Future<void> openFile(ClipboardItem item) async {
  if (item.localPath != null) {
    final result = await OpenFilex.open(item.localPath!);

    switch (result.type) {
      case ResultType.error:
      case ResultType.noAppToOpen:
        showTextSnackbar("No application knows how to open this file.");
        break;
      case ResultType.permissionDenied:
        showTextSnackbar("You don't have permission to open this file.");
        break;
      case _:
    }
  }
}