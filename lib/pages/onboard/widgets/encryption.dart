import 'package:clipboard/di/di.dart';
import 'package:clipboard/pages/onboard/widgets/encryption/export_key.dart';
import 'package:clipboard/pages/onboard/widgets/encryption/generate_key.dart';
import 'package:clipboard/pages/onboard/widgets/encryption/import_key.dart';
import 'package:clipboard/pages/onboard/widgets/to_login_page.dart';
import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/bloc/auth_cubit/auth_cubit.dart';
import 'package:copycat_base/data/services/encryption.dart';
import 'package:copycat_base/domain/model/auth_user/auth_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EncryptionStep extends StatelessWidget {
  final VoidCallback onContinue;
  const EncryptionStep({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthCubit, AuthState, AuthUser?>(
      selector: (state) {
        return state.mapOrNull(
          authenticated: (value) => value.user,
        );
      },
      builder: (context, user) {
        return BlocSelector<AppConfigCubit, AppConfigState, EncryptionSecret?>(
          selector: (state) {
            return state.config.enc2Key;
          },
          builder: (context, secret) {
            if (user == null) return Center(child: ToLoginPage());
            final keyId = user.enc2KeyId;
            final enc1 = user.enc1;

            if (keyId == null || enc1 == null) {
              return GenerateEncryptionKeyStep(
                onContinue: onContinue,
              );
            }

            if (secret == null) {
              return ImportEncryptionKeyStep(
                importableKeyId: keyId,
                clipboardRepository: sl(
                  instanceName: "cloud",
                ),
                onContinue: onContinue,
              );
            }
            return ExportEncryptionKeyStep(
              exportableKeyId: keyId,
              exportableEnc2Key: secret.serialized,
              onContinue: onContinue,
            );
          },
        );
      },
    );
  }
}
