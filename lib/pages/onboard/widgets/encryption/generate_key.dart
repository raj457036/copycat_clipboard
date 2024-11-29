import 'package:animate_do/animate_do.dart';
import 'package:clipboard/pages/onboard/widgets/locale_and_logout.dart';
import 'package:clipboard/widgets/dialogs/confirm_dialog.dart';
import 'package:clipboard/widgets/dialogs/info_dialog.dart';
import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/bloc/auth_cubit/auth_cubit.dart';
import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/data/services/encryption.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class GenerateEncryptionKeyStep extends StatefulWidget {
  final VoidCallback onContinue;
  const GenerateEncryptionKeyStep({super.key, required this.onContinue});

  @override
  State<GenerateEncryptionKeyStep> createState() =>
      _GenerateEncryptionKeyStepState();
}

class _GenerateEncryptionKeyStepState extends State<GenerateEncryptionKeyStep> {
  late final AuthCubit authCubit;
  late final AppConfigCubit appConfigCubit;
  bool generating = false;
  bool saving = false;
  (EncryptionSecret, String, String)? generatedKeys;

  @override
  void initState() {
    super.initState();
    authCubit = context.read();
    appConfigCubit = context.read();
  }

  Future<void> generateEnc2Key() async {
    final enc2 = EncryptionSecret.generate();
    final keyId = const Uuid().v4();
    final encryption = EncryptionManager(enc2);

    setState(() {
      generating = true;
    });

    await wait(500);

    final enc1Decrypt = EncryptionSecret.generate();
    final enc1 = encryption.encrypt(enc1Decrypt.serialized);

    await wait(500);
    setState(() {
      generating = false;
      generatedKeys = (enc2, keyId, enc1);
    });
  }

  Future<void> saveAndContinue() async {
    final (enc2, keyId, enc1) = generatedKeys!;

    setState(() {
      saving = true;
    });
    try {
      await appConfigCubit.setE2EEKey(enc2.serialized);
      await authCubit.setupEncryption(keyId, enc1);
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
      title: "✋ Your Clips Will Be Insecure",
      message:
          "You haven’t generated an encryption key yet. Without it, your clips will remain unencrypted and insecure. You can generate the key later in Settings ❯ Security. Do you still want to continue?",
      yes: context.locale.yes,
      no: context.locale.no,
      confirmationDelay: 5,
    ).open(context);

    if (!answer) return;
    widget.onContinue();
  }

  Future<void> whyDoINeedIt() async {
    await InfoDialog(
      title: "🤔 Why Do I Need Encryption?",
      message:
          "Encryption protects your data by converting it into a secure format that can only be accessed with a key. Without encryption, your clips are stored in plain text, making them vulnerable to unauthorized access. Enabling encryption ensures that only you can access your sensitive data, providing an extra layer of security against potential breaches.",
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
            Spacer(),
            Icon(
              Icons.lock,
              size: 28,
            ),
            height10,
            Text(
              "Setup Clipboard Encryption",
              style: textTheme.headlineMedium,
            ),
            height10,
            if (generating || saving)
              CircularProgressIndicator()
            else if (generatedKeys != null)
              Column(
                children: [
                  Text(
                    "🎉 Key ${generatedKeys?.$2.sub(end: 6)}*** Generated 🎉",
                    style: textTheme.titleMedium,
                  ),
                  height16,
                  OverflowBar(
                    children: [
                      TextButton(
                        onPressed: generateEnc2Key,
                        child: Text('Re-Generate Key'),
                      ),
                      width10,
                      FilledButton(
                        onPressed: saveAndContinue,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(context.locale.continue_),
                            width4,
                            Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )
            else
              Column(
                children: [
                  Text(
                    "Your account doesn't have any encreyption key",
                    style: textTheme.titleMedium,
                  ),
                  height10,
                  OverflowBar(
                    children: [
                      FilledButton.icon(
                        onPressed: generateEnc2Key,
                        label: Text('Generate Key'),
                        icon: Icon(Icons.key),
                      ),
                      width10,
                      TextButton(
                        onPressed: doItLater,
                        child: Text('Do it later'),
                      ),
                    ],
                  ),
                  height20,
                  TextButton.icon(
                    style: TextButton.styleFrom(),
                    onPressed: whyDoINeedIt,
                    label: Text("Why It's Important?"),
                    icon: Icon(Icons.info),
                  ),
                ],
              ),
            Spacer(),
            LocaleAndLogoutRow(enableLogout: !(generating || saving)),
          ],
        ),
      ),
    );
  }
}
