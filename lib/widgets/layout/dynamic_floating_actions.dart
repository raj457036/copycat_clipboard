import 'package:clipboard/widgets/copycat_logo.dart';
import 'package:clipboard/widgets/fabs/create_collection.dart';
import 'package:clipboard/widgets/fabs/paste.dart';
import 'package:clipboard/widgets/fabs/sync_status.dart';
import 'package:clipboard/widgets/local_user.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:flutter/material.dart';

class DynamicFloatingActions extends StatelessWidget {
  final int activeIndex;
  final bool reversed;
  final bool showCopyCatLogo;
  const DynamicFloatingActions({
    super.key,
    required this.activeIndex,
    required this.reversed,
    this.showCopyCatLogo = false,
  });

  @override
  Widget build(BuildContext context) {
    if (activeIndex == 0) {
      final actions = [
        if (showCopyCatLogo) const CopyCatLogo(),
        const PasteFAB(),
        height8,
        const SyncStatusFAB()
      ];
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: reversed ? actions.reversed.toList() : actions,
      );
    }
    if (activeIndex == 1) {
      final actions = [
        if (showCopyCatLogo) const CopyCatLogo(),
        const DisableForLocalUser(
          ifLocal: CreateCollectionButton(
            localMode: true,
          ),
          child: CreateCollectionButton(),
        ),
        height8,
        const SyncStatusFAB()
      ];
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: reversed ? actions.reversed.toList() : actions,
      );
    }
    return const SizedBox.shrink();
  }
}
