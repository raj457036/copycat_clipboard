import 'package:clipboard/routes/utils.dart';
import 'package:clipboard/widgets/clip_card.dart';
import 'package:clipboard/widgets/load_more_card.dart';
import 'package:clipboard/widgets/nav_rail.dart';
import 'package:copycat_base/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:copycat_base/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  Future<void> _loadMore(BuildContext context) async {
    await context.read<ClipboardCubit>().fetch();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);
    final floatingActionButton = getFloatingActionButton(
      context,
      0,
      isMobile: isMobile,
    );

    final content = LeftNavRail(
      floatingActionButton: floatingActionButton,
      navbarActiveIndex: 0,
      child: RefreshIndicator(
        onRefresh: () async => await syncChanges(context),
        child: BlocSelector<ClipboardCubit, ClipboardState,
            (List<ClipboardItem>, bool, bool)>(
          selector: (state) {
            return (state.items, state.hasMore, state.loading);
          },
          builder: (context, state) {
            final (items, hasMore, loading) = state; //Subject;

            if (items.isEmpty) {
              if (loading) {
                return const Center(child: CircularProgressIndicator());
              }
              return Center(
                child: Text(context.locale.emptyClipboard),
              );
            }

            return GridView.builder(
              padding: insetLTR16,
              primary: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                childAspectRatio: isMobile ? 2 / 3 : 1,
              ),
              itemCount: items.length + (hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == items.length) {
                  return LoadMoreCard(loadMore: _loadMore);
                }

                final item = items[index];
                return ClipCard(
                  key: ValueKey("clipboard-item-${item.id}"),
                  autoFocus: index == 0,
                  item: item,
                );
              },
            );
          },
        ),
      ),
    );

    return content;
  }
}
