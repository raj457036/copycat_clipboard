import 'package:clipboard/pages/home/widgets/clips_provider.dart';
import 'package:clipboard/widgets/can_paste_builder.dart';
import 'package:clipboard/widgets/clip_view_builders/grid/builder.dart';
import 'package:clipboard/widgets/clip_view_builders/grid/view.dart';
import 'package:clipboard/widgets/clip_view_builders/list/builder.dart';
import 'package:copycat_base/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/widgets/app_layout_builder.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => await syncChanges(context),
      child: AppLayoutBuilder(
        builder: (context, layout, _) {
          return switch (layout) {
            AppLayout.grid => ClipGrid(
                builder: (delegate, scrollDirection, canPaste) {
                  return ClipsProvider(
                    builder: (context, clips, hasMore, loading, loadMore) {
                      return ClipGridBuilder(
                        items: clips,
                        hasMore: hasMore,
                        loading: loading,
                        loadMore: loadMore,
                        delegate: delegate,
                        scrollDirection: scrollDirection,
                        canPaste: canPaste,
                      );
                    },
                  );
                },
              ),
            AppLayout.list => CanPasteBuilder(
                builder: (context, canPaste) {
                  return ClipsProvider(
                    builder: (context, clips, hasMore, loading, loadMore) {
                      return ClipListBuilder(
                        items: clips,
                        hasMore: hasMore,
                        loading: loading,
                        loadMore: loadMore,
                        canPaste: canPaste,
                      );
                    },
                  );
                },
              ),
          };
        },
      ),
    );
  }
}
