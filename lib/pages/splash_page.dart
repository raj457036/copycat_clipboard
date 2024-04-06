import 'package:appwrite/appwrite.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  final Account account;

  const SplashPage({
    super.key,
    required this.account,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          switch (state) {
            case AuthenticatedAuthState() || OfflineAuthState():
              context.read<ClipboardCubit>().fetch();
              context.goNamed(RouteConstants.home);
              break;
            case UnauthenticatedAuthState():
              context.goNamed(RouteConstants.login);
            default:
          }
        },
        child: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
