import 'package:clipboard/widgets/clip_item/clip_list_item/clip_list_item.dart';
import 'package:clipboard/widgets/clip_item/clip_menu_provider.dart';
import 'package:clipboard/widgets/empty.dart';
import 'package:clipboard/widgets/load_more_card.dart';
import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:copycat_base/widgets/clipcard_loading.dart';
import 'package:flutter/material.dart';

class ClipListBuilder extends StatelessWidget {
  final List<ClipboardItem> items;
  final bool hasMore;
  final bool loading;
  final VoidCallback loadMore;
  final bool canPaste;

  const ClipListBuilder({
    super.key,
    required this.items,
    required this.hasMore,
    required this.loading,
    required this.loadMore,
    required this.canPaste,
  });

  @override
  Widget build(BuildContext context) {
    final width = context.mq.size.width;
    final isMobile = Breakpoints.isMobile(width);
    if (items.isEmpty) {
      if (loading) {
        return const ClipcardLoading();
      }
      return EmptyNote(note: context.locale.emptyClipboard);
    }

    return ListView.builder(
      padding: isMobile ? const EdgeInsets.all(padding8) : inset12,
      primary: true,
      itemCount: items.length + (hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == items.length) {
          return LoadMoreCard(
            key: const ValueKey("clipboard-items-load-more"),
            loadMore: loadMore,
          );
        }

        final item = items[index];
        return ClipMenuProvider(
          item: item,
          child: ClipListItem(
            key: ValueKey("clipboard-item-${item.id}"),
            item: item,
            autofocus: index == 0 && isDesktopPlatform,
            canPaste: canPaste,
          ),
        );
      },
    );
  }
}
