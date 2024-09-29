import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class LoadMoreCard extends StatelessWidget {
  final VoidCallback loadMore;
  const LoadMoreCard({
    super.key,
    required this.loadMore,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Card.outlined(
      color: colors.secondaryContainer,
      child: InkWell(
        borderRadius: radius12,
        onTap: loadMore,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.more_horiz_rounded),
              width8,
              Text(context.locale.loadMore),
            ],
          ),
        ),
      ),
    );
  }
}
