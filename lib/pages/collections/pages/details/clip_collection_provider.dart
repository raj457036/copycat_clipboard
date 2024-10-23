import 'package:clipboard/di/di.dart';
import 'package:copycat_base/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:copycat_base/bloc/collection_clips_cubit/collection_clips_cubit.dart';
import 'package:copycat_base/bloc/selected_clips_cubit/selected_clips_cubit.dart';
import 'package:copycat_base/db/clip_collection/clipcollection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClipCollectionProvider extends StatelessWidget {
  final int collectionId;
  final Widget Function(BuildContext context, ClipCollection collection)
      builder;
  const ClipCollectionProvider({
    super.key,
    required this.collectionId,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final collection = context.read<ClipCollectionCubit>().get(collectionId);

    return FutureBuilder(
      future: collection,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return MultiBlocProvider(
          providers: [
            BlocProvider<CollectionClipsCubit>(
              create: (context) => sl(param1: snapshot.data)..search(),
            ),
            BlocProvider<SelectedClipsCubit>(create: (context) => sl()),
          ],
          child: builder(context, snapshot.data),
        );
      },
    );
  }
}
