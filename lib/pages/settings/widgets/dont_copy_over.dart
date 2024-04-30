import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/constants/numbers/file_sizes.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DontAutoCopyOver extends StatelessWidget {
  const DontAutoCopyOver({super.key});

  @override
  Widget build(BuildContext context) {
    if (isMobile) return const SizedBox.shrink();
    final textTheme = context.textTheme;
    final colors = context.colors;
    return BlocSelector<AppConfigCubit, AppConfigState, int>(
      selector: (state) {
        switch (state) {
          case AppConfigLoaded(:final config):
            return config.dontCopyOver;
          default:
            return $10MB;
        }
      },
      builder: (context, state) {
        return ListTile(
          title: const Text("Don't Auto Copy Over"),
          subtitle: Text(
            "Files and Media over a certain size "
            "(${formatBytes(state, precise: false)}) will not be "
            "copied automatically.",
            style: textTheme.bodySmall?.copyWith(
              color: colors.outline,
            ),
          ),
          trailing: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: state,
              padding: const EdgeInsets.symmetric(horizontal: padding16),
              borderRadius: radius12,
              items: const [
                DropdownMenuItem(
                  value: $5MB,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox.square(
                        dimension: 24,
                        child: Icon(
                          Icons.circle,
                          size: 5,
                        ),
                      ),
                      width12,
                      Text("5 MB"),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: $10MB,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox.square(
                        dimension: 24,
                        child: Icon(
                          Icons.circle,
                          size: 10,
                        ),
                      ),
                      width12,
                      Text("10 MB"),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: $20MB,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox.square(
                        dimension: 24,
                        child: Icon(
                          Icons.circle,
                          size: 15,
                        ),
                      ),
                      width12,
                      Text("20 MB"),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: $50MB,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox.square(
                        dimension: 24,
                        child: Icon(
                          Icons.circle,
                          size: 20,
                        ),
                      ),
                      width12,
                      Text("50 MB"),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: $100MB,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.circle, size: 24),
                      width12,
                      Text("100 MB"),
                    ],
                  ),
                ),
              ],
              onChanged: (size) {
                if (size != null) {
                  context.read<AppConfigCubit>().changeDontCopyOver(size);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
