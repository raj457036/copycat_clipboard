import 'package:clipboard/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/pages/collections/widgets/collection_list_item.dart';
import 'package:clipboard/routes/utils.dart';
import 'package:clipboard/widgets/local_user.dart';
import 'package:clipboard/widgets/nav_rail.dart';
import 'package:clipboard/widgets/no_collection.dart';
import 'package:clipboard/widgets/pro_tip_banner.dart';
import 'package:clipboard/widgets/subscription/active_plan.dart';
import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:copycat_base/constants/widget_styles.dart';
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
    final floatingActionButton = getFloatingActionButton(
      context,
      2,
      isMobile: isMobile,
    );
    return BlocListener<SyncManagerCubit, SyncManagerState>(
      listenWhen: ((previous, current) {
        return current is ClipCollectionSyncedSyncState;
      }),
      listener: (context, state) {
        onRefresh(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.locale.collections),
          actions: [
            ActivePlanAction(compact: isMobile),
            width12,
          ],
        ),
        body: LeftNavRail(
          floatingActionButton: floatingActionButton,
          navbarActiveIndex: 2,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final isMobile = Breakpoints.isMobile(width);

              return RefreshIndicator(
                onRefresh: () => onRefresh(context),
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: DisableForLocalUser(
                        child: ProTipTile(
                          tip: context.locale.useCollectionProTip,
                        ),
                      ),
                    ),
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
                                  mainAxisSpacing: padding8,
                                  crossAxisSpacing: padding8,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  final collection = collections[index];
                                  return ClipCollectionListItem(
                                    collection: collection,
                                    shape: !isMobile
                                        ? const RoundedRectangleBorder(
                                            borderRadius: radius8,
                                            side: BorderSide(
                                              color: Color(0x5F9E9E9E),
                                            ),
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
        ),
      ),
    );
  }
}
