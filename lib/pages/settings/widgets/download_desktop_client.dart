import 'package:copycat_base/constants/strings/strings.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DownloadDesktopClientTile extends StatelessWidget {
  const DownloadDesktopClientTile({super.key});

  Future<void> openDownloadPage() async {
    if (await canLaunchUrlString(downloadUrl)) {
      launchUrlString(downloadUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    String title = context.locale.downloadDesktop;
    IconData icon = Icons.desktop_mac_rounded;

    if (isDesktopPlatform) {
      title = context.locale.downloadPhone;
      icon = Icons.phone_android_sharp;
    }

    return ListTile(
      title: Text(title, style: textTheme.titleSmall),
      subtitle: Text(context.locale.downloadClientDesc),
      leading: Icon(icon),
      trailing: const Icon(Icons.open_in_new),
      tileColor: colors.primaryContainer,
      textColor: colors.primary,
      iconColor: colors.secondary,
      onTap: openDownloadPage,
    );
  }
}
