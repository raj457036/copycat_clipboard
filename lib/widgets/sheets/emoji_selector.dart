import 'package:copycat_base/utils/common_extension.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

class EmojiSelectorSheet extends StatefulWidget {
  const EmojiSelectorSheet({super.key});

  @override
  State<EmojiSelectorSheet> createState() => _EmojiSelectorSheetState();

  Future<Emoji?> open(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      enableDrag: true,
      showDragHandle: true,
      builder: (context) {
        return this;
      },
    );
  }
}

class _EmojiSelectorSheetState extends State<EmojiSelectorSheet>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    return Padding(
      padding: EdgeInsets.only(bottom: mq.viewInsets.bottom),
      child: EmojiPicker(
        onEmojiSelected: (Category? category, Emoji emoji) {
          Navigator.pop(context, emoji);
        },
        config: Config(
          checkPlatformCompatibility: true,
          bottomActionBarConfig: BottomActionBarConfig(
            backgroundColor: colorScheme.surface,
            buttonColor: colorScheme.surface,
            buttonIconColor: colorScheme.onSurface,
          ),
          searchViewConfig: SearchViewConfig(
            backgroundColor: colorScheme.surface,
            buttonColor: colorScheme.surface,
            buttonIconColor: colorScheme.onSurface,
          ),
          categoryViewConfig: CategoryViewConfig(
            backgroundColor: colorScheme.surface,
            recentTabBehavior: RecentTabBehavior.NONE,
          ),
          emojiViewConfig: EmojiViewConfig(
            backgroundColor: colorScheme.surface,
          ),
        ),
        // textEditingController:
        // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
      ),
    );
  }
}
