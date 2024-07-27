import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/constants/key.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:window_manager/window_manager.dart';

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

  Future<void> onUri(Uri uri) async {
    logger.i("🔗 NEW APP LINK: $uri");

    if (rootNavKey.currentContext != null) {
      showTextSnackbar(
        rootNavKey.currentContext!.locale.pleaseWait,
        isLoading: true,
      );
    }

    if (isDesktopPlatform) {
      await windowManager.show();
      await Future.delayed(const Duration(seconds: 2));
    }

    if (!mounted) return;

    if (rootNavKey.currentContext == null) return;
    // clipboard://drive-connect?code=4/0AeaYSHB-QUSzN0WX8F-R7Y-64KkUUgAgT5lrHXVmrgFPr7mJIM9p_aHJJpKg0XXBuytu1Q&scope=https://www.googleapis.com/auth/drive.appdata%20https://www.googleapis.com/auth/drive.file
    if (uri.host == "drive-connect") {
      final code = uri.queryParameters["code"];
      final scope = uri.queryParameters["scope"] ?? "";
      final error = uri.queryParameters["error"];
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

      if (error != null) {
        context.read<DriveSetupCubit>().setupError(error);
      }
    }
    if (uri.host == "auth") {
      final code = uri.queryParameters["code"];
      if (code != null) {
        final path = await context.read<AuthCubit>().validateAuthCode(code);
        await Future.delayed(const Duration(seconds: 2));
        if (path != null) {
          rootNavKey.currentContext?.pushNamed(path);
        }
      }
    }
    closeSnackbar();
  }

  @override
  void initState() {
    super.initState();
    sub = appLink.uriLinkStream.listen(onUri);
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
