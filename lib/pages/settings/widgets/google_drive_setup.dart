import 'package:clipboard/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/pages/settings/widgets/issue_card.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoogleDriveSetup extends StatelessWidget {
  const GoogleDriveSetup({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return BlocBuilder<DriveSetupCubit, DriveSetupState>(
      builder: (context, state) {
        switch (state) {
          case DriveSetupUnknown(:final waiting):
            return ListTile(
              title: const Text("Google Drive Connection Status"),
              subtitle: Text(waiting ? "Authorizing..." : "Fetching status..."),
              trailing: const CircularProgressIndicator(),
            );
          case DriveSetupDone():
            return ListTile(
              title: const Text("Google Drive Connection Status"),
              subtitle: const Text("rs457036@gmail.com"),
              trailing: Text(
                "Connected",
                style: textTheme.titleMedium?.copyWith(
                  color: Colors.green,
                ),
              ),
            );
          case DriveSetupError():
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding16),
                  child: IssueCard(
                    color: Colors.deepOrange,
                    description:
                        "Google Drive not connected, File and media syncing is disabled.\n\n"
                        "Note: Your files and media are synced securely across "
                        "devices using Google Drive to protect your privacy.",
                  ),
                ),
                ListTile(
                  title: const Text("Google Drive Connection Status"),
                  trailing: ElevatedButton.icon(
                    onPressed: () {
                      context.read<DriveSetupCubit>().startSetup();
                    },
                    icon: const Icon(Icons.add_to_drive_rounded),
                    label: const Text("Connect Now"),
                  ),
                )
              ],
            );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
