import 'package:clipboard/widgets/dialogs/confirm_dialog.dart';
import 'package:copycat_base/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:copycat_base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:copycat_base/constants/strings/route_constants.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:open_filex/open_filex.dart';
import 'package:universal_io/io.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> copyToClipboard(
  BuildContext context,
  ClipboardItem item, {
  bool saveFile = false,
  bool noAck = false,
}) async {
  try {
    final cubit = context.read<OfflinePersistanceCubit>();
    final result = await cubit.copyToClipboard(item, saveFile: saveFile);
    if (noAck || !context.mounted) return;
    if (result && !Platform.isAndroid) {
      showTextSnackbar(
        saveFile ? context.locale.exportSuccess : context.locale.copySuccess,
      );
    }
  } catch (e) {
    showTextSnackbar("⭕️ Failed to copy. Something went wrong!");
  }
}

Future<void> preview(BuildContext context, ClipboardItem item) async {
  context.pushNamed(
    RouteConstants.preview,
    pathParameters: {
      "id": item.id.toString(),
    },
  );
}

Future<void> shareClipboardItem(
  BuildContext context,
  ClipboardItem item,
) async {
  context
      .read<OfflinePersistanceCubit>()
      .shareClipboardItem(context, item)
      .catchError((_) {
    showTextSnackbar(context.locale.failed);
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

Future<void> launchPhone(ClipboardItem item) async {
  await launchUrlString("tel:${item.text}");
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

Future<void> pasteContent(BuildContext context) async {
  showTextSnackbar(
    "Pasting to clipboard",
    isLoading: true,
    closePrevious: true,
  );
  await context.read<OfflinePersistanceCubit>().paste();
  showTextSnackbar("Paste success", closePrevious: true);
}
