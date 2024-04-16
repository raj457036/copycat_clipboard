import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LogoutButton extends StatelessWidget {
  final bool iconMode;
  const LogoutButton({
    super.key,
    this.iconMode = true,
  });

  Future<void> logout(BuildContext context) async {
    context.read<AuthCubit>().logout();
    context.goNamed(RouteConstants.login);
  }

  @override
  Widget build(BuildContext context) {
    if (iconMode) {
      return IconButton(
        onPressed: () => logout(context),
        icon: const Icon(Icons.logout),
      );
    }

    return ElevatedButton.icon(
      onPressed: () => logout(context),
      label: const Text('Logout'),
      icon: const Icon(Icons.logout),
    );
  }
}
