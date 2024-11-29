import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:clipboard/widgets/dialogs/confirm_dialog.dart';
import 'package:clipboard/widgets/dialogs/info_dialog.dart';
import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

class ExportEncryptionKeyStep extends StatefulWidget {
  final String exportableKeyId;
  final String exportableEnc2Key;
  final VoidCallback onContinue;
  const ExportEncryptionKeyStep({
    super.key,
    required this.exportableKeyId,
    required this.exportableEnc2Key,
    required this.onContinue,
  });

  @override
  State<ExportEncryptionKeyStep> createState() =>
      _ExportEncryptionKeyStepState();
}

class _ExportEncryptionKeyStepState extends State<ExportEncryptionKeyStep> {
  bool exporting = false;
  bool exported = false;

  Future<void> exportEnc2Key() async {
    setState(() {
      exporting = true;
    });
    try {
      final locale = context.locale;
      final windowAction = context.windowAction;
      final json = {
        "enc2Id": widget.exportableKeyId,
        "enc2": widget.exportableEnc2Key,
      };
      final content = jsonEncode(json);

      final path = await FilePicker.platform.saveFile(
          fileName: "copycat-e2ee-vault-key.enc2",
          type: FileType.custom,
          allowedExtensions: ['enc2'],
          bytes: utf8.encode(content));
      await windowAction?.show();
      if (path != null) {
        exported = true;
        if (isDesktopPlatform) {
          await File(path).writeAsString(content);
        }
        showTextSnackbar(locale.exportSuccess, success: true);
      }
    } catch (e) {
      showFailureSnackbar(Failure.fromException(e));
    } finally {
      setState(() {
        exporting = false;
      });
    }
  }

  Future<void> doItLater() async {
    if (exported) {
      widget.onContinue();
      return;
    }
    final answer = await ConfirmDialog(
      title: "✋ Backup Your Encryption Key",
      message:
          "You haven’t exported your encryption key yet. Without a backup, you won’t be able to access your encrypted clips if the key is lost or you switch devices.\n\n"
          "If you already have a secure backup of your key, you can safely continue. Otherwise, we strongly recommend exporting the key now to avoid data loss. Do you still want to continue?",
      yes: context.locale.yes,
      no: context.locale.no,
      confirmationDelay: 5,
    ).open(context);

    if (!answer) return;
    widget.onContinue();
  }

  Future<void> whyExportKey() async {
    await InfoDialog(
      title: "🤔 Why Export the Encryption Key?",
      message:
          "Exporting your encryption key is essential for securely accessing your encrypted data on multiple devices. Without the key, your encrypted data will remain inaccessible after sync.\n\n"
          "Keep a backup of your encryption key in a secure location to prevent data loss. Remember, the key is unique to your account and cannot be recovered if lost.\n\n"
          "Note: Copycat cannot access your encrypted clips or your encryption keys. This is because we value your privacy above everything else.",
    ).open(context);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return ZoomIn(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.lock,
              size: 28,
            ),
            height10,
            Text(
              "Clipboard Encryption",
              style: textTheme.headlineMedium,
            ),
            height16,
            if (exporting)
              CircularProgressIndicator()
            else
              FadeIn(
                child: Column(
                  children: [
                    Text(
                      "🥳 Great news! Local encryption is already setup on your clipboard.",
                      style: textTheme.titleMedium,
                    ),
                    height16,
                    OverflowBar(
                      children: [
                        FilledButton.icon(
                          onPressed: exportEnc2Key,
                          label: Text('Export Key'),
                          icon: Icon(Icons.key),
                        ),
                        width10,
                        TextButton(
                          onPressed: doItLater,
                          child: Text(context.locale.continue_),
                        ),
                      ],
                    ),
                    height20,
                    TextButton.icon(
                      style: TextButton.styleFrom(),
                      onPressed: whyExportKey,
                      label: Text("Why Export the Encryption Key?"),
                      icon: Icon(Icons.info),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
