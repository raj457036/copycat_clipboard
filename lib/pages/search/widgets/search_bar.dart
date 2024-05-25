import 'package:atom_event_bus/atom_event_bus.dart';
import 'package:clipboard/bloc/search_cubit/search_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/pages/search/widgets/search_keyboard_shortcut.dart';
import 'package:clipboard/utils/common_extension.dart';
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

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      focusNode: focusNode,
      padding: const EdgeInsets.symmetric(horizontal: padding16).msp,
      leading: const Icon(Icons.search_rounded),
      hintText: "Search in clipboard",
      autoFocus: true,
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {
        context.read<SearchCubit>().search(value);
      },
    );
  }
}
