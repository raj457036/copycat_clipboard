import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/constants/key.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppLinkListener extends StatefulWidget {
  final Widget child;
  const AppLinkListener({
    super.key,
    required this.child,
  });
  @override
  State<AppLinkListener> createState() => _AppLinkListenerState();
}

class _AppLinkListenerState extends State<AppLinkListener> {
  late StreamSubscription sub;
  final appLink = AppLinks();

  void onUri(Uri uri) {
    logger.i("🔗 NEW APP LINK: $uri");

    if (rootNavKey.currentContext == null) return;
    // clipboard:/drive_connect?code=4/0AeaYSHB-QUSzN0WX8F-R7Y-64KkUUgAgT5lrHXVmrgFPr7mJIM9p_aHJJpKg0XXBuytu1Q&scope=https://www.googleapis.com/auth/drive.appdata%20https://www.googleapis.com/auth/drive.file
    if (uri.pathSegments.contains("drive_connect")) {
      final code = uri.queryParameters["code"];
      final scope = uri.queryParameters["scope"] ?? "";
      if (code != null) {
        rootNavKey.currentContext?.pushNamed(
          RouteConstants.driveConnect,
          pathParameters: {
            "code": code,
          },
          queryParameters: {
            "scopes": scope,
          },
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    sub = appLink.allUriLinkStream.listen(onUri);
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
