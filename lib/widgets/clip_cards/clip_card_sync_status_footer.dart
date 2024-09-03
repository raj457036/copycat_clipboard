import 'package:copycat_base/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
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
    if (item.lastSynced != null || item.driveFileId != null) {
      return const SizedBox.shrink();
    }
    final colors = context.colors;

    String buttonText;

    if (item.isSyncing) {
      if (item.uploading) {
        if (item.uploadProgress != null && item.uploadProgress! > 0) {
          final percent = ((item.uploadProgress ?? 0) * 100) ~/ 1;
          buttonText = '↑ $percent%';
        } else {
          buttonText = context.locale.uploading;
        }
      } else {
        buttonText = context.locale.syncing;
      }
    } else {
      buttonText = context.locale.sync;
    }

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
                if (width > 200)
                  Text(
                    context.locale.local,
                    style: context.textTheme.labelMedium,
                  ),
                const Spacer(),
                ElevatedButton(
                  onPressed: item.isSyncing
                      ? null
                      : () {
                          context.read<CloudPersistanceCubit>().persist(
                                item.copyWith(userIntent: true)
                                  ..applyId(
                                    item,
                                  ),
                              );
                        },
                  child: Text(
                    buttonText,
                    style: context.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
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
