import 'package:clipboard/widgets/dialogs/collection_selector.dart';
import 'package:clipboard/widgets/dialogs/confirm_dialog.dart';
import 'package:clipboard/widgets/window_focus_manager.dart';
import 'package:copycat_base/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:copycat_base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:copycat_base/constants/key.dart';
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
    final ctx = context.mounted ? context : rootNavKey.currentContext!;
    final cubit = ctx.read<OfflinePersistanceCubit>();
    final result = await cubit.copyToClipboard(item, saveFile: saveFile);
    if (noAck && ctx.mounted) return;
    if (result && !Platform.isAndroid) {
      showTextSnackbar(
        // ignore: use_build_context_synchronously
        saveFile ? ctx.locale.exportSuccess : ctx.locale.copySuccess,
        closePrevious: true,
      );
    }
  } catch (e) {
    showTextSnackbar(
      "⭕️ Failed to copy. Something went wrong!",
      closePrevious: true,
    );
  }
}

Future<void> preview(BuildContext context, ClipboardItem item) async {
  final ctx = context.mounted ? context : rootNavKey.currentContext!;
  ctx.pushNamed(
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
  final ctx = context.mounted ? context : rootNavKey.currentContext!;
  ctx
      .read<OfflinePersistanceCubit>()
      .shareClipboardItem(ctx, item)
      .catchError((_) {
    showTextSnackbar(ctx.locale.failed);
  });
}

Future<void> downloadFile(
  BuildContext context,
  ClipboardItem item,
) async {
  final ctx = context.mounted ? context : rootNavKey.currentContext!;
  ctx.read<CloudPersistanceCubit>().download(item);
}

Future<void> launchUrl(ClipboardItem item) async {
  if (item.url != null && Uri.tryParse(item.url!) != null) {
    await launchUrlString(item.url!);
  }
}

Future<void> launchPhone(ClipboardItem item) async {
  await launchUrlString("tel:${item.text}");
}

Future<void> pasteOnLastWindow(BuildContext context, ClipboardItem item) async {
  final focusManager = WindowFocusManager.of(context);
  focusManager?.toggleAndPaste(item);
}

Future<bool> deleteClipboardItem(
  BuildContext context,
  ClipboardItem item,
) async {
  final ctx = context.mounted ? context : rootNavKey.currentContext!;
  final confirmation = await const ConfirmDialog(
    title: "Delete Item",
    message: "Are you sure to delete this item?",
  ).open(ctx);

  if (!confirmation) return false;

  // ignore: use_build_context_synchronously
  await ctx.read<CloudPersistanceCubit>().delete(item);
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
  final ctx = context.mounted ? context : rootNavKey.currentContext!;
  await ctx.read<OfflinePersistanceCubit>().paste();
  showTextSnackbar("Paste success", closePrevious: true);
}

Future<void> changeCollection(BuildContext context, ClipboardItem item) async {
  final ctx = context.mounted ? context : rootNavKey.currentContext!;
  final cubit = ctx.read<OfflinePersistanceCubit>();
  final router = GoRouter.of(context);

  final collection = await ClipCollectionSelectionDialog(
    selectedCollectionId: item.collectionId,
  ).open(ctx);

  if (collection != null) {
    final updatedItem = item.copyWith(
      collectionId: collection.id,
      serverCollectionId: collection.serverId,
    )..applyId(item);
    cubit.persist(updatedItem);
    router.pop();
  }
}
