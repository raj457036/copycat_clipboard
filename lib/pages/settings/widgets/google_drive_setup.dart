import 'package:clipboard/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:clipboard/constants/strings/asset_constants.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/pages/settings/widgets/info_card.dart';
import 'package:clipboard/utils/common_extension.dart';
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
        String text = "Connected";
        bool noClick = false;
        bool hasError = false;
        switch (state) {
          case DriveSetupUnknown(:final waiting):
            text = waiting ? "Authorizing..." : "Loading...";
            noClick = true;
          case DriveSetupDone():
            text = "Connected";
            noClick = true;
            break;
          case DriveSetupError():
            text = "Connect Now";
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
                title: hasError ? null : "ⓘ Tips",
                color: hasError ? Colors.deepOrange : colors.primary,
                description:
                    "${hasError ? "Google Drive not connected, File and media syncing is disabled.\n\n" : ""}"
                    "Your files and media are synced securely across "
                    "devices using Google Drive to protect your privacy.",
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
