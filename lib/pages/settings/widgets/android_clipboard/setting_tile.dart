import 'package:copycat_base/constants/strings/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AndroidClipboardSettingListTile extends StatelessWidget {
  const AndroidClipboardSettingListTile({super.key});

  void openSetting(BuildContext context) {
    context.goNamed(RouteConstants.androidBgClipboardSettings);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Background Listener"),
      subtitle: const Text("Listen to the clipboard in the background"),
      trailing: const Icon(Icons.navigate_next),
      onTap: () => openSetting(context),
    );
  }
}
