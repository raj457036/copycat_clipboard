import 'package:clipboard/pages/search/widgets/search_bar.dart';
import 'package:clipboard/pages/search/widgets/search_page_content.dart';
import 'package:clipboard/widgets/layout/custom_scaffold.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      activeIndex: 1,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 6),
        child: Center(
          child: SearchInputBar(),
        ),
      ),
      body: Column(
        children: [
          height10,
          Row(
            children: [
              Chip(
                label: Text("24 Aug 2024 - 28 Aug 2024"),
              )
            ],
          ),
          Expanded(child: SearchPageContent()),
        ],
      ),
    );
  }
}
