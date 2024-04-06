import 'package:appwrite/appwrite.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  final Account account;

  const SplashPage({
    super.key,
    required this.account,
  });

  Future<void> _navigate(BuildContext context) async {
    // context.goNamed(RouteConstants.mood);

    try {
      final user = await account.get();
      // ignore: use_build_context_synchronously
      context.goNamed(RouteConstants.home);
    } catch (e) {
      // ignore: use_build_context_synchronously
      context.goNamed(RouteConstants.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Durations.extralong4, () => _navigate(context));
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
