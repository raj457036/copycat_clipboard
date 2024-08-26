import 'package:clipboard/pages/collections/widgets/appbar.dart';
import 'package:clipboard/pages/collections/widgets/collection_list_item.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/layout/custom_scaffold.dart';
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
    final crossAxisCount = Breakpoints.on<int>(
      width,
      default_: 1,
      tablet: 2,
      desktop: 3,
    );
    return BlocListener<SyncManagerCubit, SyncManagerState>(
      listenWhen: ((previous, current) {
        return current is ClipCollectionSyncedSyncState;
      }),
      listener: (context, state) {
        onRefresh(context);
      },
      child: CustomScaffold(
        activeIndex: 2,
        appBar: isMobilePlatform ? const CollectionAppBar() : null,
        body: Column(
          children: [
            DisableForLocalUser(
              child: ProTipTile(
                tip: context.locale.useCollectionProTip,
              ),
            ),
            Expanded(
              child: ScaffoldBody(
                child: RefreshIndicator(
                    onRefresh: () => onRefresh(context),
                    child:
                        BlocBuilder<ClipCollectionCubit, ClipCollectionState>(
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

                              final aspectRatio = width / (68 * crossAxisCount);
                              final builder = GridView.builder(
                                padding: isMobile
                                    ? const EdgeInsets.only(bottom: padding12)
                                    : inset12,
                                itemCount: collections.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount,
                                  childAspectRatio: aspectRatio,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  final collection = collections[index];
                                  return ClipCollectionListItem(
                                    autoFocus: isDesktopPlatform && index == 0,
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
          ],
        ),
      ),
    );
  }
}
