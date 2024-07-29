import 'package:clipboard/l10n/l10n.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class ExportE2eeDialog extends StatelessWidget {
  final bool loading;
  final VoidCallback exportEnc2Key;

  const ExportE2eeDialog({
    super.key,
    required this.loading,
    required this.exportEnc2Key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return AlertDialog(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.lock),
          width12,
          Text(
            context.locale.e2eeVault,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          width12,
          const Spacer(),
          const CloseButton(),
        ],
      ),
      content: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 420,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card.outlined(
              margin: EdgeInsets.zero,
              color: Colors.green.withOpacity(0.2),
              child: ListTile(
                title: Text(
                  context.locale.e2eeExportNote,
                  textAlign: TextAlign.center,
                ),
                titleTextStyle: textTheme.titleSmall,
                textColor: Colors.green,
              ),
            ),
            height12,
            Text(
              context.locale.e2eeExportDesc,
              textAlign: TextAlign.center,
            ),
            height10,
            ElevatedButton.icon(
              icon: const Icon(Icons.key),
              label: Text(context.locale.exportKey),
              onPressed: loading ? null : exportEnc2Key,
            )
          ],
        ),
      ),
    );
  }
}
