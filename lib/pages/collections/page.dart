import 'package:clipboard/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:clipboard/constants/numbers/breakpoints.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/pages/collections/widgets/collection_list_item.dart';
import 'package:clipboard/widgets/no_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  Future<void> onRefresh(BuildContext context) async {
    await context.read<ClipCollectionCubit>().fetch(fromTop: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Collections"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final isMobile = Breakpoints.isMobile(width);

          return RefreshIndicator(
            onRefresh: () => onRefresh(context),
            child: CustomScrollView(
              slivers: <Widget>[
                BlocBuilder<ClipCollectionCubit, ClipCollectionState>(
                  builder: (context, state) {
                    switch (state) {
                      case ClipCollectionInitial():
                        return const SliverFillRemaining(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      case ClipCollectionError(:final failure):
                        return SliverFillRemaining(
                          child: Center(
                            child: Text(failure.message),
                          ),
                        );
                      case ClipCollectionLoaded(:final collections):
                        {
                          if (collections.isEmpty) {
                            return const SliverFillRemaining(
                              child: NoCollectionAvailable(),
                            );
                          }

                          final crossAxisCount = isMobile ? 1 : 3;
                          final aspectRatio = width / (68 * crossAxisCount);
                          final builder = SliverGrid.builder(
                            itemCount: collections.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              childAspectRatio: aspectRatio,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              final collection = collections[index];
                              return ClipCollectionListItem(
                                collection: collection,
                                shape: !isMobile
                                    ? const RoundedRectangleBorder(
                                        borderRadius: radius8,
                                      )
                                    : null,
                              );
                            },
                          );

                          if (isMobile) return builder;
                          return SliverPadding(
                            padding: insetAll16,
                            sliver: builder,
                          );
                        }
                    }
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
