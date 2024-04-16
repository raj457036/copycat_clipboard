import 'package:clipboard/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/widgets/clip_card.dart';
import 'package:clipboard/widgets/logout_button.dart';
import 'package:clipboard/widgets/sync_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        actions: const [
          SyncStatusButton(),
          LogoutButton(),
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

          return GridView.builder(
            padding: const EdgeInsets.all(padding16),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              crossAxisSpacing: padding6,
              mainAxisSpacing: padding6,
              childAspectRatio: 1,
            ),
            itemCount: items.length + hasMore,
            itemBuilder: (context, index) {
              if (index == items.length) {
                return Card.outlined(
                  child: Center(
                    child: TextButton.icon(
                      onPressed: () => _loadMore(context),
                      label: const Text(
                        "Load More",
                      ),
                      icon: const Icon(Icons.read_more),
                    ),
                  ),
                );
              }

              final item = state.$1[index];
              return ClipCard(
                key: ValueKey("clipboard-item-${item.id}"),
                item: item,
              );
            },
          );
        },
      ),
    );
  }
}
