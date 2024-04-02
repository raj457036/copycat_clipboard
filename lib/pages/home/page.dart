import 'package:clipboard/constants/widget_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clipboard"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: padding16,
            ),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FilterChip(
                  label: const Text("All"),
                  onSelected: (_) {},
                  selected: false,
                ),
                width6,
                FilterChip(
                  label: const Text("Text"),
                  onSelected: (_) {},
                  selected: false,
                ),
              ],
            ),
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(padding12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: padding6,
          mainAxisSpacing: padding6,
          childAspectRatio: 5 / 6,
        ),
        itemBuilder: (context, index) {
          return Card.outlined(
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () async {},
              child: const Center(child: Text("Content")),
            ),
          );
        },
      ),
    );
  }
}
