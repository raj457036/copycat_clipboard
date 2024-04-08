import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.breakpoints.isMobile;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(isMobile ? 80 : 100),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(padding16),
              child: SearchBar(
                padding: const EdgeInsets.symmetric(horizontal: padding16).msp,
                leading: const Icon(Icons.search_rounded),
                hintText: "Search in clipboard",
                autoFocus: true,
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  print("Submitted: $value");
                },
              ),
            ),
          )),
      body: const Column(
        children: [],
      ),
    );
  }
}
