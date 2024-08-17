import 'package:clipboard/di/di.dart';
import 'package:copycat_base/constants/strings/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class CopycatAboutTile extends StatelessWidget {
  const CopycatAboutTile({super.key});

  @override
  Widget build(BuildContext context) {
    final info = sl<PackageInfo>();
    final version = info.version;
    final build = info.buildNumber;
    return AboutListTile(
      dense: true,
      icon: const Icon(Icons.info_outline),
      applicationName: "CopyCat Clipboard",
      applicationIcon: const Image(
        image: AssetImage(AssetConstants.copyCatIcon),
        width: 60,
      ),
      applicationVersion: "$version+$build",
      applicationLegalese: "Copyright (c) 2024 Entility Studio",
    );
  }
}
