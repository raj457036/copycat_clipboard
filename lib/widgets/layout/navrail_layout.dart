import 'package:clipboard/widgets/layout/navrail.dart';
import 'package:copycat_base/bloc/window_action_cubit/window_action_cubit.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavrailLayout extends StatelessWidget {
  final Widget? floatingActionButton;
  final int navbarActiveIndex;
  final Widget child;

  const NavrailLayout({
    super.key,
    required this.navbarActiveIndex,
    required this.child,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WindowActionCubit, WindowActionState>(
      builder: (context, state) {
        if (state.view == AppView.topDocked ||
            state.view == AppView.bottomDocked) return child;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NavLayoutNavrail(
              navbarActiveIndex: navbarActiveIndex,
              floatingActionButton: floatingActionButton,
            ),
            Expanded(child: child),
          ],
        );
      },
    );
  }
}
