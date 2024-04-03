import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';

class ClipCard extends StatelessWidget {
  const ClipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Column(
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(padding8),
                child: Text("Hello World"),
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
                            "Link",
                            style: context.textTheme.titleSmall,
                          ),
                          Text(
                            "4 days ago",
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
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
