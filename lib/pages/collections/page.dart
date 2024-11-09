import 'package:clipboard/pages/collections/widgets/appbar.dart';
import 'package:clipboard/pages/collections/widgets/clip_collection_grid_item.dart';
import 'package:clipboard/widgets/layout/custom_scaffold.dart';
import 'package:clipboard/widgets/local_user.dart';
import 'package:clipboard/widgets/no_collection.dart';
import 'package:clipboard/widgets/pro_tip_banner.dart';
import 'package:clipboard/widgets/scaffold_body.dart';
import 'package:copycat_base/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  Future<void> onRefresh(BuildContext context) async {
    await context.read<ClipCollectionCubit>().fetch(fromTop: true);
  }

  @override
  Widget build(BuildContext context) {
    final width = context.mq.size.width;
    final isMobile = Breakpoints.isMobile(width);
    final crossAxisCount =
        Breakpoints.on<int>(width, default_: 1, tablet: 2, desktop: 3);
    return CustomScaffold(
      activeIndex: 1,
      appBar: isMobilePlatform ? const CollectionAppBar() : null,
      body: Column(
        children: [
          if (width > 200)
            DisableForLocalUser(
              child: ProTipTile(
                tip: context.locale.useCollectionProTip,
              ),
            ),
          Expanded(
            child: ScaffoldBody(
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
                          const aspectRatio = 16 / 7;
                          final builder = GridView.builder(
                            padding: isMobile
                                ? const EdgeInsets.only(bottom: padding12)
                                : inset12,
                            itemCount: collections.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              childAspectRatio: aspectRatio,
                              mainAxisExtent: 100,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              final collection = collections[index];
                              return ClipCollectionGridItem(
                                autoFocus: isDesktopPlatform && index == 0,
                                collection: collection,
                              );
                            },
                          );

                          return builder;
                        }
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
