import 'package:clipboard/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DriveSetupPage extends StatelessWidget {
  final String code;
  final List<String> scopes;

  const DriveSetupPage({
    super.key,
    required this.code,
    required this.scopes,
  });

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
              context.pop();
          }
        },
        builder: (context, state) {
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
        },
      ),
    );
  }
}
