import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/widgets/app_layout_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLayoutToggleButton extends StatelessWidget {
  final bool rounded;
  const AppLayoutToggleButton({
    super.key,
    this.rounded = false,
  });

  void changeLayout(BuildContext context, AppLayout layout) {
    context.read<AppConfigCubit>().changeAppLayout(layout);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AppLayoutBuilder(builder: (context, layout, supported) {
      if (!supported) return const SizedBox.shrink();
      return IconButton(
        onPressed: () {
          switch (layout) {
            case AppLayout.grid:
              changeLayout(context, AppLayout.list);
            case AppLayout.list:
              changeLayout(context, AppLayout.grid);
          }
        },
        padding: EdgeInsets.zero,
        style: IconButton.styleFrom(
          shape: rounded ? null : const RoundedRectangleBorder(),
          backgroundColor: rounded ? colors.surfaceContainerHighest : null,
        ),
        iconSize: 20,
        icon: layout == AppLayout.grid
            ? const Icon(Icons.window)
            : const Icon(Icons.view_agenda),
        tooltip: layout == AppLayout.grid
            ? context.locale.layoutToList
            : context.locale.layoutToGrid,
      );
    });
  }
}
