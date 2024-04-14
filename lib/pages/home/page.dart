import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/widgets/clip_card.dart';
import 'package:clipboard/widgets/sync_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _loadMore(BuildContext context) async {
    await context.read<ClipboardCubit>().fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clipboard"),
        actions: [
          const SyncStatusButton(),
          IconButton(
              onPressed: () async {
                context.read<AuthCubit>().logout();
                context.goNamed(RouteConstants.login);
              },
              icon: const Icon(Icons.logout)),
          width16,
        ],
      ),
      body: BlocSelector<ClipboardCubit, ClipboardState,
          (List<ClipboardItem>, bool)>(
        selector: (state) {
          return (state.items, state.hasMore);
        },
        builder: (context, state) {
          final items = state.$1;
          final hasMore = state.$2 ? 1 : 0;

          if (items.isEmpty) {
            return const Center(
              child: Text("Your clipboard is empty."),
            );
          }

          return ResponsiveGridView.builder(
            padding: const EdgeInsets.all(padding16),
            gridDelegate: const ResponsiveGridDelegate(
              minCrossAxisExtent: 300,
              maxCrossAxisExtent: 300,
              crossAxisSpacing: padding12,
              mainAxisSpacing: padding12,
              childAspectRatio: 3 / 4,
              // childAspectRatio: 3 / 4,
            ),
            itemCount: items.length + hasMore,
            itemBuilder: (context, index) {
              if (index == items.length) {
                return Center(
                  child: TextButton(
                    onPressed: () => _loadMore(context),
                    child: const Text("Load More"),
                  ),
                );
              }

              final item = state.$1[index];
              return ClipCard(item: item);
            },
          );
        },
      ),
    );
  }
}
