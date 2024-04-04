import 'package:clipboard/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClipCard extends StatelessWidget {
  final ClipboardItem item;
  const ClipCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Column(
        children: [
          Expanded(
            child: InkWell(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              onTap: () {},
              child: SizedBox.expand(
                child: Padding(
                  padding: const EdgeInsets.all(padding8),
                  child: Text(
                    item.value!,
                    overflow: TextOverflow.fade,
                    maxLines: 10,
                  ),
                ),
              ),
            ),
          ),
          const Divider(height: 0),
          SizedBox.fromSize(
            size: const Size.fromHeight(56),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(padding8),
                child: Row(
                  children: [
                    // const Icon(Icons.abc_rounded),
                    // width8,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item.type.name.toUpperCase(),
                          style: context.textTheme.titleSmall,
                        ),
                        Text(
                          item.modified.ago,
                          style: context.textTheme.labelSmall,
                        ),
                      ],
                    ),
                    const Spacer(),
                    // IconButton(
                    //   icon: const Icon(Icons.arrow_outward_rounded),
                    //   tooltip: "Open link",
                    //   onPressed: () {},
                    // ),
                    // IconButton(
                    //   icon: const Icon(Icons.download_rounded),
                    //   tooltip: "Download",
                    //   onPressed: () {},
                    // ),
                    IconButton(
                      icon: const Icon(Icons.copy),
                      tooltip: "Copy",
                      onPressed: () async {
                        context
                          ..read<ClipboardCubit>().copyToClipboard(item)
                          ..showTextSnackbar("Copied to clipboard");
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
