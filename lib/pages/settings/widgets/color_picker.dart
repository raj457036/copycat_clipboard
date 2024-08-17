import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:go_router/go_router.dart';

class ColorPickerDialog extends StatefulWidget {
  final Color selectedColor;
  const ColorPickerDialog({
    super.key,
    required this.selectedColor,
  });

  @override
  State<ColorPickerDialog> createState() => _ColorPickerDialogState();

  Future<Color?> open(BuildContext context) async {
    final result = await showDialog<Color?>(
      context: context,
      builder: (context) => this,
    );

    if (result != null) return result;
    return null;
  }
}

class _ColorPickerDialogState extends State<ColorPickerDialog> {
  Color? color_;

  void onChangeColor(Color color) {
    color_ = color;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;
    final colors = context.colors;
    final size = MediaQuery.of(context).size;
    final isMobile = Breakpoints.isMobile(size.width);
    final double width, height;
    if (size.width > 650) {
      width = 650;
      height = 200;
    } else {
      width = 250;
      height = 495;
    }
    return AlertDialog(
      actionsPadding: const EdgeInsets.only(
        left: padding10,
        right: padding10,
        bottom: padding12,
      ),
      // titlePadding: EdgeInsets.zero,
      content: SingleChildScrollView(
        child: SizedBox(
          width: width,
          height: height,
          child: Theme(
            data: theme.copyWith(
              inputDecorationTheme: InputDecorationTheme(
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: colors.surfaceContainer,
              ),
              textTheme: textTheme,
            ),
            child: ColorPicker(
              portraitOnly: false,
              pickerColor: widget.selectedColor,
              onColorChanged: onChangeColor,
              pickerAreaBorderRadius: BorderRadius.circular(18),
              displayThumbColor: true,
              hexInputBar: true,
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(context.locale.cancel),
        ),
        TextButton(
          onPressed: () {
            context.pop(color_);
          },
          child: Text(context.locale.done),
        ),
      ],

      insetPadding: isMobile
          ? const EdgeInsets.all(padding8)
          : const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      contentPadding: const EdgeInsets.only(
        left: padding12,
        right: padding12,
        top: padding12,
      ),
    );
  }
}

class ColorPickerTile extends StatelessWidget {
  const ColorPickerTile({super.key});

  Future<void> chooseColor(BuildContext context, Color color) async {
    final cubit = context.read<AppConfigCubit>();
    final result = await ColorPickerDialog(
      selectedColor: color,
    ).open(context);

    if (result != null) {
      cubit.setThemeColor(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    return ListTile(
      title: Text(context.locale.themeColor),
      contentPadding: const EdgeInsets.only(
        left: padding16,
        right: padding4,
      ),
      subtitle: Text(
        context.locale.themeColorDesc,
        style: textTheme.bodySmall?.copyWith(
          color: colors.outline,
        ),
      ),
      trailing: BlocSelector<AppConfigCubit, AppConfigState, int>(
        selector: (state) {
          return state.config.themeColor;
        },
        builder: (context, themeColor) {
          final color = Color(
            themeColor.isNegative ? defaultThemeColor : themeColor,
          );
          return ElevatedButton.icon(
            onPressed: () => chooseColor(context, color),
            label: Text(context.locale.change),
            icon: const Icon(Icons.color_lens_rounded),
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(150, 40),
              backgroundColor: colors.primary,
              foregroundColor: colors.onPrimary,
              textStyle: textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
