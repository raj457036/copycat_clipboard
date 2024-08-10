import 'package:clipboard/pages/collections/widgets/collection_list_item.dart';
import 'package:clipboard/widgets/local_user.dart';
import 'package:clipboard/widgets/no_collection.dart';
import 'package:clipboard/widgets/pro_tip_banner.dart';
import 'package:clipboard/widgets/scaffold_body.dart';
import 'package:copycat_base/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:copycat_base/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  Future<void> onRefresh(BuildContext context) async {
    await context.read<ClipCollectionCubit>().fetch(fromTop: true);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);

    return BlocListener<SyncManagerCubit, SyncManagerState>(
      listenWhen: ((previous, current) {
        return current is ClipCollectionSyncedSyncState;
      }),
      listener: (context, state) {
        onRefresh(context);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,

          title: Text(context.locale.collections),
          // actions: [
          //   ActivePlanAction(compact: isMobile),
          //   width12,
          // ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(55),
            child: DisableForLocalUser(
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: ProTipTile(
                  tip: context.locale.useCollectionProTip,
                ),
              ),
            ),
          ),
        ),
        body: ScaffoldBody(
          child: RefreshIndicator(
              onRefresh: () => onRefresh(context),
              child: BlocBuilder<ClipCollectionCubit, ClipCollectionState>(
                builder: (context, state) {
                  switch (state) {
                    case ClipCollectionInitial():
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case ClipCollectionError(:final failure):
                      return Center(
                        child: Text(failure.message),
                      );
                    case ClipCollectionLoaded(:final collections):
                      {
                        if (collections.isEmpty) {
                          return const Center(
                            child: NoCollectionAvailable(),
                          );
                        }

                        final crossAxisCount = isMobile ? 1 : 3;
                        final aspectRatio = width / (68 * crossAxisCount);
                        final builder = GridView.builder(
                          padding: isMobile
                              ? insetLRB16
                              : const EdgeInsets.all(padding12),
                          itemCount: collections.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            childAspectRatio: aspectRatio,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            final collection = collections[index];
                            return ClipCollectionListItem(
                              autoFocus: index == 0,
                              collection: collection,
                              shape: !isMobile
                                  ? const RoundedRectangleBorder(
                                      borderRadius: radius8,
                                    )
                                  : null,
                            );
                          },
                        );

                        return builder;
                      }
                  }
                },
              )),
        ),
      ),
    );
  }
}
