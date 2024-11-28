import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:clipboard/pages/onboard/widgets/locale_and_logout.dart';
import 'package:clipboard/widgets/dialogs/confirm_dialog.dart';
import 'package:clipboard/widgets/dialogs/info_dialog.dart';
import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/bloc/auth_cubit/auth_cubit.dart';
import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/domain/repositories/clipboard.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImportEncryptionKeyStep extends StatefulWidget {
  final String importableKeyId;
  final ClipboardRepository clipboardRepository;
  final VoidCallback onContinue;
  const ImportEncryptionKeyStep({
    super.key,
    required this.importableKeyId,
    required this.clipboardRepository,
    required this.onContinue,
  });

  @override
  State<ImportEncryptionKeyStep> createState() =>
      _ImportEncryptionKeyStepState();
}

class _ImportEncryptionKeyStepState extends State<ImportEncryptionKeyStep> {
  late final AuthCubit authCubit;
  late final AppConfigCubit appConfigCubit;

  bool importing = false;
  bool saving = false;
  String? importedKey;

  @override
  void initState() {
    super.initState();
    authCubit = context.read();
    appConfigCubit = context.read();
  }

  Future<void> importEnc2Key() async {
    setState(() {
      importing = true;
    });
    final windowAction = context.windowAction;
    final locale = context.locale;
    await wait(100);
    try {
      final pickedFile = await FilePicker.platform.pickFiles(
        type: isDesktopPlatform ? FileType.custom : FileType.any,
        allowedExtensions: isDesktopPlatform ? ['enc2'] : null,
        withData: true,
      );

      await windowAction?.show();

      if (pickedFile == null) return;
      if (pickedFile.files.first.bytes == null) return;
      final content = utf8.decode(pickedFile.files.first.bytes!);
      final json = jsonDecode(content);
      final importedKeyId = json["enc2Id"];
      importedKey = json["enc2"];

      if (importedKeyId == null ||
          importedKeyId != widget.importableKeyId ||
          importedKey == null) {
        showFailureSnackbar(Failure.fromMessage(locale.importE2eeInvalidKey));
        return;
      }

      setState(() {});
    } catch (e) {
      showFailureSnackbar(Failure.fromException(e));
    } finally {
      await wait(200);
      setState(() {
        importing = false;
      });
    }
  }

  Future<void> saveAndContinue() async {
    if (importedKey == null) return;

    setState(() {
      saving = true;
    });
    try {
      appConfigCubit.setE2EEKey(importedKey);
    } catch (e) {
      showFailureSnackbar(Failure.fromException(e));
    } finally {
      if (mounted) {
        setState(() {
          saving = false;
        });
      }
    }
  }

  Future<void> doItLater() async {
    final answer = await ConfirmDialog(
      title: "✋ Encrypted Clips Inaccessible",
      message:
          "You haven’t imported the encryption key yet. This means all your encrypted clips will remain inaccessible locally after sync. To access them, import the key from Settings ❯ Security. Do you still want to continue?",
      yes: context.locale.yes,
      no: context.locale.no,
      confirmationDelay: 5,
    ).open(context);

    if (!answer) return;
    widget.onContinue();
  }

  Future<void> resetEncryption() async {
    final answer = await ConfirmDialog(
      title: "✋ Permanently Delete Encrypted Data",
      message:
          "This action is irreversible. Are you sure you want to permanently delete all encrypted data from the server?",
      confirmationDelay: 10,
    ).open(context);

    if (!answer) return;

    setState(() {
      saving = true;
    });

    try {
      final result = await widget.clipboardRepository.deleteAllEncrypted();
      await result.fold((l) async => showFailureSnackbar(l), (_) async {
        await authCubit.removeEncryptionSetup();
        showTextSnackbar("Encryption Reset is Complete", success: true);
      });
    } finally {
      setState(() {
        saving = false;
      });
    }
  }

  Future<void> whereIsMyKey() async {
    await InfoDialog(
      title: "🤔 Where is my key?",
      message:
          "Your encryption key is a secure file generated during the encryption setup process. If you’ve misplaced it, check your downloads folder or any backup location where you might have saved it. Without this key, your encrypted data cannot be accessed.\n\n"
          "If you’ve set up the encryption key on another device, you can export it by going to Settings ❯ Security ❯ E2EE Vault on that device. Transfer the key securely to this device to regain access to your encrypted data.",
    ).open(context);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ZoomIn(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                if (importing || saving)
                  CircularProgressIndicator()
                else
                  FadeIn(
                    child: Column(
                      children: [
                        Text(
                          "🥳 Great news! Your account already has encryption enabled.",
                        ),
                        height16,
                        OverflowBar(
                          children: [
                            FilledButton.icon(
                              onPressed: importEnc2Key,
                              label: Text('Import Key'),
                              icon: Icon(Icons.key),
                            ),
                            width10,
                            TextButton(
                              onPressed: doItLater,
                              child: Text('Do It Later'),
                            ),
                          ],
                        ),
                        height20,
                        TextButton.icon(
                          style: TextButton.styleFrom(),
                          onPressed: whereIsMyKey,
                          label: Text("Where Is My Key?"),
                          icon: Icon(Icons.info),
                        ),
                        SizedBox(width: 50, child: Divider(height: 40)),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: colors.error,
                          ),
                          onPressed: resetEncryption,
                          icon: Icon(Icons.lock_reset_rounded),
                          label: Text("Reset Encryption"),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
        LocaleAndLogoutRow(enableLogout: !(importing || saving)),
      ],
    );
  }
}
