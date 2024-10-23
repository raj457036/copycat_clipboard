import 'package:copycat_base/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef ClipProviderBuilder = Widget Function(
  BuildContext context,
  List<ClipboardItem> clips,
  bool hasMore,
  bool loading,
  VoidCallback loadMore,
);

class ClipsProvider extends StatelessWidget {
  final ClipProviderBuilder builder;
  const ClipsProvider({
    super.key,
    required this.builder,
  });

  Future<void> loadMore(BuildContext context) async {
    await context.read<ClipboardCubit>().fetch();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ClipboardCubit, ClipboardState,
        (List<ClipboardItem>, bool, bool)>(
      selector: (state) {
        return (state.items, state.hasMore, state.loading);
      },
      builder: (context, state) {
        final (items, hasMore, loading) = state;
        return builder(
          context,
          items,
          hasMore,
          loading,
          () => loadMore(context),
        );
      },
    );
  }
}
