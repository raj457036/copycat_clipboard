import 'package:clipboard/utils/common_extension.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
              context.pop(emoji);
            },
            config: Config(
              checkPlatformCompatibility: true,
              bottomActionBarConfig: BottomActionBarConfig(
                backgroundColor: colorScheme.background,
                buttonColor: colorScheme.background,
                buttonIconColor: colorScheme.onBackground,
              ),
              searchViewConfig: SearchViewConfig(
                backgroundColor: colorScheme.background,
                buttonColor: colorScheme.background,
                buttonIconColor: colorScheme.onBackground,
              ),
              categoryViewConfig: CategoryViewConfig(
                backgroundColor: colorScheme.background,
                recentTabBehavior: RecentTabBehavior.NONE,
              ),
              emojiViewConfig: EmojiViewConfig(
                backgroundColor: colorScheme.background,
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
