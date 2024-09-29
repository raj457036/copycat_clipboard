import 'package:clipboard/widgets/clip_item/clip_card/encrypted_card.dart';
import 'package:clipboard/widgets/clip_item/clip_card/text_clip_card.dart';
import 'package:clipboard/widgets/clip_item/clip_card/url_clip_card.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/enums/clip_type.dart';
import 'package:copycat_base/widgets/clip_cards/file_clip_card.dart';
import 'package:copycat_base/widgets/clip_cards/media_clip_card.dart';
import 'package:flutter/material.dart';

class ClipPreview extends StatelessWidget {
  final ClipboardItem item;
  final AppLayout layout;
  const ClipPreview({
    super.key,
    required this.item,
    required this.layout,
  });

  @override
  Widget build(BuildContext context) {
    if (item.encrypted) return const EncryptedClipItem();
    return switch (item.type) {
      ClipItemType.text => TextClipCard(item: item, layout: layout),
      ClipItemType.media => MediaClipCard(item: item, layout: layout),
      ClipItemType.url => UrlClipCard(item: item, layout: layout),
      ClipItemType.file => FileClipCard(item: item, layout: layout),
    };
  }
}
