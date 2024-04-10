import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  final Account account;

  const SplashPage({
    super.key,
    required this.account,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
