import 'package:clipboard/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClipCardSyncStatusFooter extends StatelessWidget {
  final ClipboardItem item;

  const ClipCardSyncStatusFooter({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    if (item.lastSynced != null) {
      return const SizedBox.shrink();
    }
    final colors = context.colors;
    return SizedBox.fromSize(
      size: const Size.fromHeight(35),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.tertiaryContainer,
          borderRadius: radiusBottom12,
        ),
        child: Padding(
          padding: const EdgeInsets.all(padding8),
          child: LayoutBuilder(builder: (context, constraints) {
            final width = constraints.maxWidth;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.sync_problem_rounded,
                  size: 18,
                ),
                width6,
                if (width > 150)
                  Text(
                    "Local",
                    style: context.textTheme.labelMedium,
                  ),
                const Spacer(),
                TextButton(
                  onPressed: item.isSyncing
                      ? null
                      : () {
                          context.read<CloudPersistanceCubit>().persist(item);
                        },
                  child: Text(
                    item.isSyncing
                        ? "Syncing (${((item.uploadProgress ?? 0) * 100) ~/ 1}%)"
                        : "Sync Now",
                    style: context.textTheme.labelMedium
                        ?.copyWith(color: colors.tertiary),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
