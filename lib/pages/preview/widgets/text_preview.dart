import 'package:clipboard/base/constants/strings/strings.dart';
import 'package:clipboard/base/enums/clip_type.dart';
import 'package:clipboard/pages/preview/view/clip_preview_config.dart';
import 'package:clipboard/utils/clipboard_actions.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/base/constants/widget_styles.dart';
import 'package:clipboard/base/domain/model/clipboard_item/clipboard_item.dart';
import 'package:clipboard/base/l10n/l10n.dart';
import 'package:flutter/material.dart';

class TextClipPreviewCard extends StatelessWidget {
  final ClipboardItem item;
  const TextClipPreviewCard({super.key, required this.item});

  Color? getBG(BuildContext context) {
    if (item.textCategory == TextCategory.color) {
      return textToColor(item);
    }
    if (item.textCategory == TextCategory.struct) {
      return context.colors.tertiaryContainer;
    }
    return null;
  }

  Color? getFG(BuildContext context, Color? bg) {
    if (item.textCategory == TextCategory.color) {
      return getFg(bg);
    }
    if (item.textCategory == TextCategory.struct) {
      return context.colors.onTertiaryContainer;
    }

    return null;
  }

  String? getFontFamily() {
    if (item.textCategory == TextCategory.struct) {
      return jetBrainsMonoFont;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final bg = getBG(context);
    final fontFamily = getFontFamily();
    TextStyle? style;

    if (item.textCategory == TextCategory.color ||
        item.textCategory == TextCategory.email ||
        item.textCategory == TextCategory.phone) {
      style = context.textTheme.headlineMedium?.copyWith(
        color: getFG(context, bg),
        fontFamily: fontFamily,
      );
    } else {
      style = context.textTheme.bodyMedium?.copyWith(
        color: getFG(context, bg),
        fontFamily: fontFamily,
      );
    }

    final config = ClipPreviewConfig.of(context);

    return Card.filled(
      key: ValueKey('text_preview_${item.id}'),
      color: bg,
      margin: EdgeInsets.zero,
      shape: config?.shape,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(padding16),
          child: SelectableText(
            item.text ?? context.locale.preview__card__missing_text,
            style: style,
            contextMenuBuilder: textSelectionToolbarButtonItems,
          ),
        ),
      ),
    );
  }
}
