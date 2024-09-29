import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/widgets/app_layout_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewLayoutToggleButton extends StatelessWidget {
  const ViewLayoutToggleButton({super.key});

  void changeLayout(BuildContext context, AppLayout layout) {
    context.read<AppConfigCubit>().changeAppLayout(layout);
  }

  @override
  Widget build(BuildContext context) {
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
          shape: const RoundedRectangleBorder(),
        ),
        iconSize: 20,
        icon: layout == AppLayout.grid
            ? const Icon(Icons.window)
            : const Icon(Icons.view_agenda),
        tooltip: 'Toggle Layout',
      );
    });
  }
}
