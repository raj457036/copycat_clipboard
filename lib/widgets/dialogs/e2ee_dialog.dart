import 'dart:convert' show utf8;

import 'package:clipboard/base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/base/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/base/data/services/encryption.dart';
import 'package:clipboard/base/data/services/e2ee_qr_transfer_service.dart';
import 'package:clipboard/base/data/services/notification_service.dart'
    show InAppNotificationService;
import 'package:clipboard/base/domain/model/auth_user/auth_user.dart';
import 'package:clipboard/base/domain/model/notification_message.dart'
    show NotificationMessage;
import 'package:clipboard/base/l10n/l10n.dart';
import 'package:clipboard/di/di.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/dialogs/confirm_dialog.dart';
import 'package:clipboard/widgets/dialogs/e2ee_dialogs/export_e2ee.dart';
import 'package:clipboard/widgets/dialogs/e2ee_dialogs/e2ee_passcode_prompt_dialog.dart';
import 'package:clipboard/widgets/dialogs/e2ee_dialogs/e2ee_qr_scan_action_button.dart';
import 'package:clipboard/widgets/dialogs/e2ee_dialogs/generate_e2ee.dart';
import 'package:clipboard/widgets/dialogs/e2ee_dialogs/import_e2ee.dart';
import 'package:clipboard/widgets/dialogs/e2ee_dialogs/qr_transfer_e2ee.dart';
import 'package:clipboard/widgets/dialogs/e2ee_dialogs/scan_qr_e2ee.dart';
import 'package:clipboard/widgets/encrypted_clip_stat.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_io/io.dart';
import 'package:uuid/uuid.dart';

class E2EESettingDialog extends StatefulWidget {
  const E2EESettingDialog({super.key});

  @override
  State<E2EESettingDialog> createState() => _E2EESettingDialogState();

  Future<void> show(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => this,
    );
  }
}

class _E2EESettingDialogState extends State<E2EESettingDialog> {
  bool loading = false;
  bool invalidImportedKey = false;

  late AuthCubit authCubit;
  late AppConfigCubit appConfigCubit;

  @override
  void initState() {
    super.initState();
    appConfigCubit = context.read<AppConfigCubit>();
    authCubit = context.read<AuthCubit>();
  }

  Future<void> importEnc2Key(String keyId) async {
    try {
      final windowAction = context.windowAction;
      final pickedFile = await FilePicker.pickFiles(
        type: isDesktopPlatform ? FileType.custom : FileType.any,
        allowedExtensions: isDesktopPlatform ? ['enc2'] : null,
        withData: true,
      );

      await windowAction?.show();

      if (pickedFile == null) return;
      if (pickedFile.files.first.bytes == null) return;
      final content = utf8.decode(pickedFile.files.first.bytes!);
      final secret = E2EEQrTransferService.decodeKeyFile(content);
      if (secret == null) {
        setState(() => invalidImportedKey = true);
        return;
      }

      await _tryImportEnc2Key(
        keyId: keyId,
        importedKeyId: secret.enc2Id,
        key: secret.enc2,
      );
    } catch (e) {
      setState(() => invalidImportedKey = true);
    }
  }

  Future<void> importEnc2KeyViaQr(String keyId) async {
    final payload = await showDialog<String>(
      context: context,
      builder: (_) => const ScanQrE2eeDialog(),
    );
    if (!mounted || payload == null || payload.isEmpty) return;

    final passcode = await E2EEPasscodePromptDialog.show(context);
    if (!mounted || passcode == null || passcode.isEmpty) return;

    final secret = E2EEQrTransferService.decryptPayload(
      payload: payload,
      passcode: passcode,
    );

    if (secret == null) {
      setState(() => invalidImportedKey = true);
      return;
    }

    await _tryImportEnc2Key(
      keyId: keyId,
      importedKeyId: secret.enc2Id,
      key: secret.enc2,
    );
  }

  Future<void> _tryImportEnc2Key({
    required String keyId,
    required String importedKeyId,
    required String key,
  }) async {
    if (importedKeyId != keyId) {
      setState(() => invalidImportedKey = true);
      return;
    }

    await appConfigCubit.setE2EEKey(key);

    final enc1 = authCubit.state.maybeWhen(
      authenticated: (user, _, _, _) => user.enc1,
      orElse: () => null,
    );

    final enc1Decrypt = await appConfigCubit.decryptEnc2(enc1);
    if (enc1Decrypt == null) {
      setState(() => invalidImportedKey = true);
      return;
    }

    EncryptionWorker.instance.dispose();
    await EncryptionWorker.instance.start(enc1Decrypt);
    await appConfigCubit.toggleAutoEncrypt(true);
    if (mounted) {
      setState(() => invalidImportedKey = false);
    }
  }

  Future<void> openQrTransfer(String keyId, String enc2Key) async {
    final passcode = E2EEQrTransferService.generatePasscode();
    final payload = E2EEQrTransferService.buildEncryptedPayload(
      enc2Id: keyId,
      enc2: enc2Key,
      passcode: passcode,
    );
    if (!mounted) return;

    await showDialog<void>(
      context: context,
      builder: (_) =>
          QrTransferE2eeDialog(payload: payload, passcode: passcode),
    );
  }

  Future<void> exportEnc2Key(
    BuildContext context,
    String keyId,
    String enc2Key,
  ) async {
    final windowAction = context.windowAction;
    final content = E2EEQrTransferService.encodeKeyFile(
      enc2Id: keyId,
      enc2: enc2Key,
    );

    final path = await FilePicker.saveFile(
      fileName: "copycat-e2ee-vault-key.enc2",
      type: FileType.custom,
      allowedExtensions: ['enc2'],
      bytes: utf8.encode(content),
    );
    await windowAction?.show();
    if (path != null) {
      if (isDesktopPlatform) {
        await File(path).writeAsString(content);
      }
      if (context.mounted) {
        context.pop();
        InAppNotificationService.i.notify(
          NotificationMessage(
            id: "e2ee_dialog_exported",
            body: context.locale.app__ack__exported,
          ),
        );
      }
    }
  }

  Future<void> generateEnc2Key() async {
    final enc2 = EncryptionSecret.generate();
    final keyId = const Uuid().v4();
    final encryption = EncryptionManager(enc2);
    final authCubit = context.read<AuthCubit>();

    final enc1Decrypt = EncryptionSecret.generate();
    final enc1 = encryption.encrypt(enc1Decrypt.serialized);

    setState(() => loading = true);

    await appConfigCubit.setE2EEKey(enc2.serialized);
    await authCubit.setupEncryption(keyId, enc1);
    setState(() {
      loading = false;
    });
  }

  Future<void> clearEnc2Key() async {
    final bool confirmed = await ConfirmDialog(
      title: context.locale.dialog__title__e2e_clear_key,
      message: context.locale.dialog__text__e2e_clear_key__confirm,
      yes: context.locale.dialog__button__e2e_clear_key,
      focusFor: false,
    ).show(context);

    if (!confirmed || !mounted) return;

    setState(() => loading = true);
    try {
      EncryptionWorker.instance.dispose();
      await appConfigCubit.toggleAutoEncrypt(false);
      await appConfigCubit.setE2EEKey(null);
    } finally {
      if (mounted) {
        setState(() => loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppConfigCubit, AppConfigState>(
      builder: (context, _) {
        return FutureBuilder<String?>(
          future: appConfigCubit.getE2EEKey(),
          builder: (context, snapshot) {
            final enc2Key = snapshot.data;
            return BlocSelector<AuthCubit, AuthState, AuthUser?>(
              selector: (state) {
                return state.whenOrNull(authenticated: (user, _, _, _) => user);
              },
              builder: (context, user) {
                if (user == null) return const SizedBox.shrink();
                final keyId = user.enc2KeyId;
                final enc1 = user.enc1;

                if (keyId == null || enc1 == null) {
                  return GenerateE2eeDialog(
                    loading: loading,
                    generateEnc2Key: generateEnc2Key,
                  );
                }

                if (enc2Key == null) {
                  return ImportE2eeDialog(
                    importEnc2Key: () => importEnc2Key(keyId),
                    scanQrEnc2Key: E2EEQrScanActionButton(
                      onPressed: () => importEnc2KeyViaQr(keyId),
                      label: context.locale.transfer__scan_qr,
                    ),
                    loading: loading,
                    invalidImportedKey: invalidImportedKey,
                    bottom: EncryptedClipsStat(
                      repository: sl(instanceName: "local"),
                      onNavigate: context.pop,
                    ),
                  );
                }
                return ExportE2eeDialog(
                  exportEnc2Key: () => exportEnc2Key(context, keyId, enc2Key),
                  transferEnc2KeyViaQr: () => openQrTransfer(keyId, enc2Key),
                  clearEnc2Key: clearEnc2Key,
                  loading: loading,
                  bottom: EncryptedClipsStat(
                    repository: sl(instanceName: "local"),
                    withDecryptButton: true,
                    onNavigate: context.pop,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
