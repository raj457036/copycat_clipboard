import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:copycat_base/constants/numbers/file_sizes.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DontAutoUploadOver extends StatelessWidget {
  const DontAutoUploadOver({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    return BlocSelector<AppConfigCubit, AppConfigState, int>(
      selector: (state) {
        switch (state) {
          case AppConfigLoaded(:final config):
            return config.dontUploadOver;
          default:
            return $10MB;
        }
      },
      builder: (context, state) {
        return ListTile(
          title: Text(context.locale.dontAutoUploadOver),
          subtitle: Text(
            context.locale.dontAutoUploadOverDesc(
              formatBytes(
                state,
                precise: false,
              ),
            ),
            style: textTheme.bodySmall?.copyWith(
              color: colors.outline,
            ),
          ),
          trailing: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: state,
              padding: const EdgeInsets.symmetric(horizontal: padding16),
              borderRadius: radius12,
              items: [
                DropdownMenuItem(
                  value: $5MB,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox.square(
                        dimension: 24,
                        child: Icon(
                          Icons.circle,
                          size: 5,
                        ),
                      ),
                      width12,
                      Text(context.locale.$5MB),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: $10MB,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox.square(
                        dimension: 24,
                        child: Icon(
                          Icons.circle,
                          size: 10,
                        ),
                      ),
                      width12,
                      Text(context.locale.$10MB),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: $20MB,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox.square(
                        dimension: 24,
                        child: Icon(
                          Icons.circle,
                          size: 15,
                        ),
                      ),
                      width12,
                      Text(context.locale.$20MB),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: $50MB,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox.square(
                        dimension: 24,
                        child: Icon(
                          Icons.circle,
                          size: 20,
                        ),
                      ),
                      width12,
                      Text(context.locale.$50MB),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: $100MB,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.circle, size: 24),
                      width12,
                      Text(context.locale.$100MB),
                    ],
                  ),
                ),
              ],
              onChanged: (size) {
                if (size != null) {
                  context.read<AppConfigCubit>().changeDontUploadOver(size);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
