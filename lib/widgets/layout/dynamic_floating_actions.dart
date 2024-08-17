import 'package:clipboard/widgets/fabs/create_collection.dart';
import 'package:clipboard/widgets/fabs/paste.dart';
import 'package:clipboard/widgets/fabs/sync_status.dart';
import 'package:clipboard/widgets/local_user.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:flutter/material.dart';

class DynamicFloatingActions extends StatelessWidget {
  final int activeIndex;
  final bool reversed;
  const DynamicFloatingActions({
    super.key,
    required this.activeIndex,
    required this.reversed,
  });

  @override
  Widget build(BuildContext context) {
    if (activeIndex == 0) {
      final actions = [const PasteFAB(), height8, const SyncStatusFAB()];
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: reversed ? actions.reversed.toList() : actions,
      );
    }
    if (activeIndex == 2) {
      final actions = [
        const DisableForLocalUser(
          ifLocal: CreateCollectionFAB(
            localMode: true,
          ),
          child: CreateCollectionFAB(),
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
