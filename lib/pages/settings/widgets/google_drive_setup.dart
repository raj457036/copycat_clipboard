import 'package:clipboard/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:clipboard/constants/strings/asset_constants.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/pages/settings/widgets/info_card.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoogleDriveSetup extends StatelessWidget {
  const GoogleDriveSetup({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    return BlocBuilder<DriveSetupCubit, DriveSetupState>(
      builder: (context, state) {
        String text = context.locale.connected;
        bool noClick = false;
        bool hasError = false;
        switch (state) {
          case DriveSetupUnknown(:final waiting):
            text =
                waiting ? context.locale.authorizing : context.locale.loading;
            noClick = true;
          case DriveSetupDone():
            text = context.locale.connected;
            noClick = true;
            break;
          case DriveSetupError():
            text = context.locale.connectNow;
            noClick = false;
            hasError = true;
            break;
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: padding16),
              child: InfoCard(
                title: hasError ? null : context.locale.tips,
                color: hasError ? Colors.deepOrange : colors.primary,
                description: context.locale.cloudStorageInfo(
                  hasError ? context.locale.cloudStorageInfoDefault : '',
                ),
              ),
            ),
            ListTile(
              title: const Text("Google Drive"),
              trailing: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(185, 40),
                  textStyle: textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: noClick
                    ? null
                    : () {
                        context.read<DriveSetupCubit>().startSetup();
                      },
                icon: Image.asset(
                  AssetConstants.googleDriveLogo,
                  height: 20,
                ),
                label: Text(text),
              ),
            )
          ],
        );
      },
    );
  }
}
