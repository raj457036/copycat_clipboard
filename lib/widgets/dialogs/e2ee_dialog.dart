import 'dart:convert' show jsonEncode, jsonDecode, utf8;

import 'package:clipboard/widgets/dialogs/e2ee_dialogs/export_e2ee.dart';
import 'package:clipboard/widgets/dialogs/e2ee_dialogs/generate_e2ee.dart';
import 'package:clipboard/widgets/dialogs/e2ee_dialogs/import_e2ee.dart';
import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/bloc/auth_cubit/auth_cubit.dart';
import 'package:copycat_base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:copycat_base/data/services/encryption.dart';
import 'package:copycat_base/domain/model/auth_user/auth_user.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:copycat_base/utils/utility.dart';
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
  String? secret;
  bool rebuilding = false;

  late AppConfigCubit appConfigCubit;

  @override
  void initState() {
    super.initState();
    appConfigCubit = context.read<AppConfigCubit>();
  }

  Future<void> importEnc2Key(String keyId) async {
    try {
      final windowAction = context.windowAction;
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
      final key = json["enc2"];

      if (importedKeyId == null) {
        setState(() => invalidImportedKey = true);
        return;
      }

      if (key == null) {
        setState(() => invalidImportedKey = true);
        return;
      }

      if (importedKeyId == keyId && key != null) {
        appConfigCubit.setE2EEKey(key);
      } else {
        setState(() => invalidImportedKey = true);
      }
    } catch (e) {
      setState(() => invalidImportedKey = true);
    }
  }

  Future<void> exportEnc2Key(
    BuildContext context,
    String keyId,
    String enc2Key,
  ) async {
    final windowAction = context.windowAction;
    final json = {
      "enc2Id": keyId,
      "enc2": enc2Key,
    };
    final content = jsonEncode(json);

    final path = await FilePicker.platform.saveFile(
        fileName: "copycat-e2ee-vault-key.enc2",
        type: FileType.custom,
        allowedExtensions: ['enc2'],
        bytes: utf8.encode(content));
    await windowAction?.show();
    if (path != null) {
      if (isDesktopPlatform) {
        await File(path).writeAsString(content);
      }
      if (context.mounted) {
        context.pop();
        showTextSnackbar(context.locale.exportSuccess);
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

  @override
  Widget build(BuildContext context) {
    return BlocListener<OfflinePersistanceCubit, OfflinePersistanceState>(
      listener: (context, state) {
        switch (state) {
          case OfflinePersistanceDecryptingState():
            setState(() {
              rebuilding = true;
            });
          case OfflinePersistanceDecryptedState():
            setState(() {
              rebuilding = false;
            });
        }
      },
      child: BlocSelector<AppConfigCubit, AppConfigState, String?>(
        selector: (state) {
          return state.config.enc2;
        },
        builder: (context, enc2Key) {
          return BlocSelector<AuthCubit, AuthState, AuthUser?>(
            selector: (state) {
              return state.whenOrNull(authenticated: (user, _) => user);
            },
            builder: (context, user) {
              if (rebuilding) {
                return Dialog(
                  child: SizedBox.square(
                    dimension: 250,
                    child: Center(
                      child: Text(
                        context.locale.rebuildingDB,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              }
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
                  loading: loading,
                  invalidImportedKey: invalidImportedKey,
                );
              }
              return ExportE2eeDialog(
                exportEnc2Key: () => exportEnc2Key(context, keyId, enc2Key),
                loading: loading,
              );
            },
          );
        },
      ),
    );
  }
}
