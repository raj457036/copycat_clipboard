import 'package:clipboard/widgets/clip_item/clip_card/clip_card.dart';
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

class ClipGridBuilder extends StatelessWidget {
  final List<ClipboardItem> items;
  final bool hasMore;
  final bool loading;
  final VoidCallback loadMore;
  final SliverGridDelegate delegate;
  final Axis scrollDirection;
  final bool canPaste;

  const ClipGridBuilder({
    super.key,
    required this.items,
    required this.hasMore,
    required this.loading,
    required this.loadMore,
    required this.delegate,
    required this.scrollDirection,
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

    return GridView.builder(
      padding: isMobile ? const EdgeInsets.all(padding8) : inset12,
      primary: true,
      scrollDirection: scrollDirection,
      gridDelegate: delegate,
      itemCount: items.length + (hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == items.length) {
          return LoadMoreCard(
            key: const ValueKey("clipboard-items-load-more"),
            loadMore: loadMore,
          );
        }

        final item = items[index];
        return ClipCard(
          key: ValueKey("clipboard-item-${item.id}"),
          autoFocus: index == 0 && isDesktopPlatform,
          item: item,
          canPaste: canPaste,
        );
      },
    );
  }
}
