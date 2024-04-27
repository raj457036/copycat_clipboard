import 'package:clipboard/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DriveSetupPage extends StatelessWidget {
  const DriveSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [
          CloseButton(),
          width8,
        ],
      ),
      body: BlocConsumer<DriveSetupCubit, DriveSetupState>(
        listener: (context, state) {
          switch (state) {
            case DriveSetupDone():
              Navigator.pop(context);
              showTextSnackbar("Drive setup done 🥳");
          }
        },
        builder: (context, state) {
          switch (state) {
            case DriveSetupError(:final failure):
              return Center(
                child: Text(failure.message),
              );
            case DriveSetupVerifyingCode():
              return const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    height10,
                    Text(
                      "Please wait while we set up\n" "syncing.",
                      textAlign: TextAlign.center,
                    ),
                    height10,
                    Text(
                      "This might take about a minute to complete.\n( Please do not close the app )",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
