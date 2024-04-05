import 'package:clipboard/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/widgets/clip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.breakpoints.isMobile;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Clipboard"),
          actions: [
            if (isMobile)
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
            width16,
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: "All"),
              Tab(text: "Sync"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BlocSelector<ClipboardCubit, ClipboardState, List<ClipboardItem>>(
              selector: (state) {
                return state.items;
              },
              builder: (context, state) {
                return ResponsiveGridView.builder(
                  padding: const EdgeInsets.all(padding16),
                  gridDelegate: const ResponsiveGridDelegate(
                    minCrossAxisExtent: 180,
                    maxCrossAxisExtent: 300,
                    crossAxisSpacing: padding12,
                    mainAxisSpacing: padding12,
                    childAspectRatio: 5 / 6,
                  ),
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    final item = state[index];
                    return ClipCard(item: item);
                  },
                );
              },
            ),
            ResponsiveGridView.builder(
              padding: isMobile
                  ? const EdgeInsets.only(
                      bottom: padding16,
                      left: padding16,
                      right: padding16,
                    )
                  : const EdgeInsets.all(padding16),
              gridDelegate: const ResponsiveGridDelegate(
                // crossAxisCount: 2,
                minCrossAxisExtent: 180,
                maxCrossAxisExtent: 240,
                crossAxisSpacing: padding6,
                mainAxisSpacing: padding6,
                childAspectRatio: 5 / 6,
              ),
              itemCount: 30,
              itemBuilder: (context, index) {
                return const Card();
              },
            ),
          ],
        ),
      ),
    );
  }
}
