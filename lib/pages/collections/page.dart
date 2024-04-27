import 'package:clipboard/constants/numbers/breakpoints.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Collections"),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = Breakpoints.isMobile(width);
        final crossAxisCount = isMobile ? 1 : 3;
        final aspectRatio = width / (68 * crossAxisCount);
        return CustomScrollView(
          slivers: <Widget>[
            SliverGrid.builder(
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: aspectRatio,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  shape: !isMobile
                      ? const RoundedRectangleBorder(borderRadius: radius8)
                      : null,
                  leading: Text(
                    "😎",
                    style: textTheme.headlineMedium,
                  ),
                  title: const Text("Quotes", maxLines: 1),
                  titleTextStyle: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  subtitle: const Text(
                    "Collection of all the favourite quotes i found so far.",
                    maxLines: 1,
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                );
              },
            )
          ],
        );
      }),
    );
  }
}
