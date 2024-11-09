import 'package:copycat_base/bloc/window_action_cubit/window_action_cubit.dart';
import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScaffoldBody extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final Color? background;
  const ScaffoldBody({
    super.key,
    required this.child,
    this.margin,
    this.background,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final width = context.mq.size.width;
    final isMobile = Breakpoints.isMobile(width);
    if (isMobile) {
      return Card(
        margin: EdgeInsets.zero,
        color: background,
        shape: const RoundedRectangleBorder(),
        child: child,
      );
    }

    return BlocSelector<WindowActionCubit, WindowActionState,
        (BorderRadius, EdgeInsetsGeometry)>(
      selector: (state) {
        BorderRadius borderRadius_;
        EdgeInsets margin_;
        switch (state.view) {
          case AppView.topDocked || AppView.bottomDocked:
            {
              borderRadius_ = BorderRadius.zero;
              margin_ = EdgeInsets.zero;
            }

          default:
            borderRadius_ = const BorderRadius.vertical(
              top: Radius.circular(18),
            );
            margin_ = const EdgeInsets.only(
              right: padding12,
            );
        }

        return (borderRadius ?? borderRadius_, margin ?? margin_);
      },
      builder: (context, state) {
        final (radius_, margin_) = state;
        return Card(
          margin: margin_,
          color: background,
          shape: RoundedRectangleBorder(
            borderRadius: radius_,
          ),
          child: child,
        );
      },
    );
  }
}
