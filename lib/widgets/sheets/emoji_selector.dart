import 'package:copycat_base/utils/common_extension.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

class EmojiSelectorSheet extends StatelessWidget {
  const EmojiSelectorSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: mq.viewInsets.bottom),
      child: BottomSheet(
        onClosing: () {},
        showDragHandle: true,
        builder: (context) {
          final theme = context.theme;
          final colorScheme = theme.colorScheme;

          return EmojiPicker(
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
          );
        },
      ),
    );
  }

  Future<Emoji?> open(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return this;
      },
    );
  }
}
