import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_io/io.dart';

class ClipDetailForm extends StatelessWidget {
  final bool isMobile;
  final ClipboardItem item;
  const ClipDetailForm({
    super.key,
    required this.item,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final options = [
      TextButton(
        onPressed: context.pop,
        child: const Text("Cancel"),
      ),
      ElevatedButton(
        onPressed: () {},
        child: const Text("Save"),
      ),
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Edit Details",
          style: textTheme.titleMedium,
        ),
        height12,
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Title",
          ),
        ),
        height12,
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Description",
          ),
          minLines: 2,
          maxLines: 6,
        ),
        height12,
        ListTile(
          title: const Text("Change Collection"),
          subtitle: const Text("No collection selected"),
          leading: const Icon(Icons.library_add),
          trailing: const Icon(Icons.chevron_right),
          shape: const RoundedRectangleBorder(borderRadius: radius8),
          onTap: () {},
        ),
        if (!isMobile) const Spacer() else height16,
        ButtonBar(
          children: Platform.isWindows ? options.reversed.toList() : options,
        )
      ],
    );
  }
}
