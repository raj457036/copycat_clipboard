import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';

class ImportE2eeDialog extends StatelessWidget {
  final bool loading;
  final VoidCallback importEnc2Key;
  final bool invalidImportedKey;

  const ImportE2eeDialog({
    super.key,
    required this.loading,
    required this.importEnc2Key,
    this.invalidImportedKey = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return AlertDialog(
      // insetPadding: const EdgeInsets.all(padding10),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.lock),
          width12,
          Text(
            context.locale.importE2eeKey,
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
            if (invalidImportedKey)
              Card.outlined(
                margin: EdgeInsets.zero,
                color: Colors.deepOrange.withOpacity(0.2),
                child: ListTile(
                  title: Text(
                    context.locale.importE2eeInvalidKey,
                    textAlign: TextAlign.center,
                  ),
                  titleTextStyle: textTheme.titleSmall,
                  textColor: Colors.deepOrange.shade800,
                ),
              ),
            if (invalidImportedKey) height12,
            Text(
              context.locale.importE2eeDesc,
              textAlign: TextAlign.center,
            ),
            height10,
            ElevatedButton.icon(
              onPressed: loading ? null : importEnc2Key,
              icon: const Icon(Icons.key),
              label: loading
                  ? Text(context.locale.importing)
                  : Text(context.locale.importKey),
            ),
          ],
        ),
      ),
    );
  }
}
