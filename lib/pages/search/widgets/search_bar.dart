import 'package:atom_event_bus/atom_event_bus.dart';
import 'package:clipboard/pages/search/widgets/filter_button.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:copycat_base/bloc/search_cubit/search_cubit.dart';
import 'package:copycat_base/common/events.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchInputBar extends StatefulWidget {
  const SearchInputBar({super.key});

  @override
  State<SearchInputBar> createState() => _SearchBarStInputate();
}

class _SearchBarStInputate extends State<SearchInputBar> {
  late final TextEditingController queryController;
  EventRule? focusEventRule;
  late final FocusNode focusNode, filterButtonFocusNode;

  @override
  void initState() {
    super.initState();
    queryController = TextEditingController();
    focusNode = FocusNode();
    if (isDesktopPlatform) {
      focusEventRule = EventRule<void>(searchFocusEvent, targets: [
        EventListener((_) => focusNode.requestFocus()),
      ]);
    }
    filterButtonFocusNode = FocusNode(skipTraversal: true);

    search("");
  }

  @override
  void dispose() {
    queryController.dispose();
    focusEventRule?.cancel();
    focusNode.dispose();
    filterButtonFocusNode.dispose();
    super.dispose();
  }

  Future<void> search(String text) async {
    await context.read<SearchCubit>().search(text);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;

    return Padding(
      padding: EdgeInsets.only(
        top: isDesktopPlatform ? padding12 : padding38,
        right: padding12,
        left: padding12,
      ),
      child: SearchBar(
        controller: queryController,
        focusNode: focusNode,
        elevation: 0.0.msp,
        padding: const EdgeInsets.only(
          left: padding16,
          right: padding8,
          top: padding2,
          bottom: padding2,
        ).msp,
        onTapOutside: (event) =>
            FocusManager.instance.primaryFocus?.nextFocus(),
        leading: const Icon(Icons.search_rounded),
        hintText: context.locale.searchInClipboard,
        trailing: [
          if (isDesktopPlatform)
            Text(
              "$metaKey + F",
              style: textTheme.labelLarge?.copyWith(
                color: colors.outline,
              ),
            ),
          width12,
          FilterButton(
            queryController: queryController,
            focusNode: filterButtonFocusNode,
          ),
        ],
        autoFocus: isDesktopPlatform,
        textInputAction: TextInputAction.search,
        onSubmitted: search,
      ),
    );
  }
}
