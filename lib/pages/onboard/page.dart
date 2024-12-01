import 'package:clipboard/di/di.dart';
import 'package:clipboard/pages/onboard/widgets/encryption.dart';
import 'package:clipboard/pages/onboard/widgets/smart_paste.dart';
import 'package:clipboard/pages/onboard/widgets/syncing/restore_clips.dart';
import 'package:clipboard/pages/onboard/widgets/syncing/restore_collections.dart';
import 'package:clipboard/pages/onboard/widgets/welcome.dart';
import 'package:copycat_base/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:copycat_base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:copycat_base/constants/strings/route_constants.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OnBoardPage extends StatefulWidget {
  final int startingStep;

  const OnBoardPage({
    super.key,
    required this.startingStep,
  });

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  late int currentStep;

  @override
  void initState() {
    super.initState();
    currentStep = widget.startingStep;
  }

  void gotToPage(int step) {
    setState(() {
      currentStep = step;
    });
  }

  void goHome() {
    context.read<DriveSetupCubit>().fetch();
    context.read<OfflinePersistenceCubit>().startListners();
    context.goNamed(RouteConstants.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(padding16),
        child: switch (currentStep) {
          0 => WelcomeStep(
              onContinue: () => gotToPage(1),
            ),
          1 => EncryptionStep(
              onContinue: () => gotToPage(2),
            ),
          2 => SmartPasteStep(
              onContinue: () => gotToPage(3),
            ),
          3 => RestoreCollectionStep(
              onContinue: () => gotToPage(4),
              collectionRepository: sl(),
            ),
          4 => RestoreClipsStep(
              onContinue: goHome,
              clipboardRepository: sl(
                instanceName: "cloud",
              ),
              restorationStatusRepository: sl(),
            ),
          _ => SizedBox.shrink(),
        },
      ),
    );
  }
}
