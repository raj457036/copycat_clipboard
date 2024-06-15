import 'dart:convert' show jsonEncode, jsonDecode, utf8;

import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/data/services/encryption.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as su;
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

  late AppConfigCubit appConfigCubit;

  @override
  void initState() {
    super.initState();
    appConfigCubit = context.read<AppConfigCubit>();
  }

  Future<void> importEnc2Key(String keyId) async {
    try {
      final pickedFile = await FilePicker.platform.pickFiles(
        type: isDesktopPlatform ? FileType.custom : FileType.any,
        allowedExtensions: isDesktopPlatform ? ['enc2'] : null,
        withData: true,
      );

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

      EncryptionSecret.deserilize(key);

      if (importedKeyId == keyId && key != null) {
        appConfigCubit.setE2EEKey(key);
      }
    } catch (e) {
      setState(() => invalidImportedKey = true);
    }
  }

  Future<void> exportEnc2Key(
      BuildContext context, String keyId, String enc2Key) async {
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
    final encryptor = EncryptionManager(enc2);

    final enc1Decrypt = EncryptionSecret.generate();
    final enc1 = encryptor.encrypt(enc1Decrypt.serialized);

    setState(() => loading = true);

    await context.read<AuthCubit>().setupEncryption(keyId, enc1);

    setState(() {
      loading = false;
    });

    appConfigCubit.setE2EEKey(enc2.serialized);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return BlocSelector<AppConfigCubit, AppConfigState, String?>(
      selector: (state) {
        return state.config.enc2;
      },
      builder: (context, enc2Key) {
        return BlocSelector<AuthCubit, AuthState, su.User?>(
          selector: (state) {
            return state.whenOrNull(authenticated: (_, user, __) => user);
          },
          builder: (context, user) {
            if (user == null) return const SizedBox.shrink();
            final keyId = user.userMetadata?["enc2KeyId"];
            final enc1 = user.userMetadata?["enc1"];

            if (keyId == null || enc1 == null) {
              return AlertDialog(
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.lock),
                    width12,
                    Text(
                      context.locale.settingE2eeVault,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    width12,
                    const Spacer(),
                    if (!loading) const CloseButton(),
                  ],
                ),
                content: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 420,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card.outlined(
                        margin: EdgeInsets.zero,
                        color: Colors.yellow.withOpacity(0.2),
                        child: ListTile(
                          title: Text(
                            context.locale.e2eeSetupWarning,
                            textAlign: TextAlign.center,
                          ),
                          titleTextStyle: textTheme.titleSmall,
                          textColor: Colors.orange.shade800,
                        ),
                      ),
                      height12,
                      Text(
                        context.locale.e2eeSetupDesc,
                        textAlign: TextAlign.center,
                      ),
                      height10,
                      ElevatedButton.icon(
                        onPressed: loading ? null : generateEnc2Key,
                        icon: const Icon(Icons.key),
                        label: loading
                            ? Text(context.locale.generating)
                            : Text(context.locale.generateKey),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (enc2Key == null) {
              return AlertDialog.adaptive(
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.lock),
                    width12,
                    Text(
                      context.locale.importE2eeKey,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    width12,
                    const Spacer(),
                    const CloseButton(),
                  ],
                ),
                content: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 420,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (invalidImportedKey)
                        Card.outlined(
                          margin: EdgeInsets.zero,
                          color: Colors.deepOrange.withOpacity(0.2),
                          child: ListTile(
                            title: Text(
                              context.locale.importE2eeInvalidKey,
                              textAlign: TextAlign.center,
                            ),
                            titleTextStyle: textTheme.titleSmall,
                            textColor: Colors.deepOrange.shade800,
                          ),
                        ),
                      height12,
                      Text(
                        context.locale.importE2eeDesc,
                        textAlign: TextAlign.center,
                      ),
                      height10,
                      ElevatedButton.icon(
                        onPressed: loading ? null : () => importEnc2Key(keyId),
                        icon: const Icon(Icons.key),
                        label: loading
                            ? Text(context.locale.importing)
                            : Text(context.locale.importKey),
                      ),
                    ],
                  ),
                ),
              );
            }
            return AlertDialog(
              title: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.lock),
                  width12,
                  Text(
                    context.locale.e2eeVault,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  width12,
                  const Spacer(),
                  const CloseButton(),
                ],
              ),
              content: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 420,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card.outlined(
                      margin: EdgeInsets.zero,
                      color: Colors.green.withOpacity(0.2),
                      child: ListTile(
                        title: Text(
                          context.locale.e2eeExportNote,
                          textAlign: TextAlign.center,
                        ),
                        titleTextStyle: textTheme.titleSmall,
                        textColor: Colors.green,
                      ),
                    ),
                    height12,
                    Text(
                      context.locale.e2eeExportDesc,
                      textAlign: TextAlign.center,
                    ),
                    height10,
                    ElevatedButton.icon(
                      icon: const Icon(Icons.key),
                      label: Text(context.locale.exportKey),
                      onPressed: loading
                          ? null
                          : () => exportEnc2Key(context, keyId, enc2Key),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
