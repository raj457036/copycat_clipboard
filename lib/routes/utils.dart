import 'package:copycat_base/constants/strings/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void onNavItemTapped(BuildContext context, int index) {
  switch (index) {
    case 0:
      context.goNamed(RouteConstants.home);
    case 1:
      context.goNamed(RouteConstants.collections);
    case 2:
      context.goNamed(RouteConstants.settings);
    default:
  }
}

Future<void> waitHere(int seconds) {
  return Future.delayed(Duration(seconds: seconds));
}
