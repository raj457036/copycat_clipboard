import 'package:copycat_base/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:copycat_base/bloc/collection_clips_cubit/collection_clips_cubit.dart';
import 'package:copycat_base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollectionClipboardListener extends StatelessWidget {
  final Widget child;

  const CollectionClipboardListener({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<OfflinePersistanceCubit, OfflinePersistanceState>(
          listenWhen: (previous, current) {
            switch (current) {
              case OfflinePersistanceDeleted() || OfflinePersistanceSaved():
                return true;
              case _:
                return false;
            }
          },
          listener: (context, state) {
            switch (state) {
              case OfflinePersistanceDeleted(:final items):
                context.read<CollectionClipsCubit>().deleteItem(items);
              case OfflinePersistanceSaved(:final items):
                final cubit = context.read<CollectionClipsCubit>();
                items.forEach(cubit.put);
              case _:
            }
          },
        ),
        BlocListener<CloudPersistanceCubit, CloudPersistanceState>(
            listener: (context, state) {
          switch (state) {
            case CloudPersistanceUploadingFile(:final item) ||
                  CloudPersistanceDownloadingFile(:final item):
              context.read<CollectionClipsCubit>().put(item);
            case CloudPersistanceError(:final failure, :final item):
              showFailureSnackbar(failure);
              if (item != null) {
                context.read<CollectionClipsCubit>().put(item);
              }
          }
        }),
      ],
      child: child,
    );
  }
}
