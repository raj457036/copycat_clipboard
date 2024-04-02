import 'package:appwrite/appwrite.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final Account account;
  const LoginPage({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(padding16),
          child: TextButton(
            onPressed: () async {
              final session = await account.createEmailSession(
                email: "rs457036@gmail.com",
                password: "Pass12345",
              );
            },
            child: const Text("Login"),
          ),
        ),
      ),
    );
  }
}
