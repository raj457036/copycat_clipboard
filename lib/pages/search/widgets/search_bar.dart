import 'package:atom_event_bus/atom_event_bus.dart';
import 'package:clipboard/bloc/search_cubit/search_cubit.dart';
import 'package:clipboard/common/events.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/analytics.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchInputBar extends StatefulWidget {
  const SearchInputBar({super.key});

  @override
  State<SearchInputBar> createState() => _SearchBarStInputate();
}

class _SearchBarStInputate extends State<SearchInputBar> {
  late final EventRule focusEventRule;
  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusEventRule = EventRule<void>(searchFocusEvent, targets: [
      EventListener((_) => focusNode.requestFocus()),
    ]);
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusEventRule.cancel();
    focusNode.dispose();
    super.dispose();
  }

  void search(String text) {
    logFeatureUsed(feature: "search");
    context.read<SearchCubit>().search(text);
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      focusNode: focusNode,
      padding: const EdgeInsets.symmetric(
        horizontal: padding16,
      ).msp,
      leading: const Icon(Icons.search_rounded),
      hintText: context.locale.searchInClipboard,
      trailing: [if (isDesktopPlatform) Text("$metaKey + F")],
      autoFocus: true,
      // trailing: [
      //   IconButton(
      //     icon: const Icon(Icons.filter_alt_rounded),
      //     onPressed: () {
      //       // context.read<SearchCubit>().clear();
      //     },
      //   ),
      // ],
      textInputAction: TextInputAction.search,
      onSubmitted: search,
    );
  }
}
