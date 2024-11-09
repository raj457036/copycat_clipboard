import 'package:clipboard/pages/collections/pages/details/clips_provider.dart';
import 'package:clipboard/widgets/app_bar/selection_appbar.dart';
import 'package:clipboard/widgets/can_paste_builder.dart';
import 'package:clipboard/widgets/clip_view_builders/grid/builder.dart';
import 'package:clipboard/widgets/clip_view_builders/grid/view.dart';
import 'package:clipboard/widgets/clip_view_builders/list/builder.dart';
import 'package:clipboard/widgets/scaffold_body.dart';
import 'package:copycat_base/bloc/collection_clips_cubit/collection_clips_cubit.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/db/clip_collection/clipcollection.dart';
import 'package:copycat_base/widgets/app_layout_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollectionDetailPage extends StatelessWidget {
  final ClipCollection collection;
  const CollectionDetailPage({
    super.key,
    required this.collection,
  });

  void loadMore(BuildContext context) {
    context.read<CollectionClipsCubit>().search(null);
  }

  @override
  Widget build(BuildContext context) {
    final title = "${collection.emoji} • ${collection.title}";
    return Scaffold(
      appBar: SelectionAppbar(
        defaultChild: AppBar(
          title: Text(title),
          centerTitle: false,
        ),
      ),
      body: ScaffoldBody(
        margin: const EdgeInsets.only(
          right: padding12,
          left: padding12,
        ),
        child: AppLayoutBuilder(
          builder: (context, layout, _) {
            return switch (layout) {
              AppLayout.grid => ClipGrid(
                  builder: (delegate, scrollDirection, canPaste) {
                    return CollectionClipsProvider(
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
                    return CollectionClipsProvider(
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
      ),
    );
  }
}
