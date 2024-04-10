import 'package:appwrite/appwrite.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/constants/strings/asset_constants.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final Account account;
  const LoginPage({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(padding16),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final isLoading = switch (state) {
                UnauthenticatedAuthState() => false,
                _ => true,
              };
              return ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(183, 40),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: const EdgeInsets.all(padding4),
                ),
                onPressed: isLoading
                    ? null
                    : context.read<AuthCubit>().createNewSession,
                label: isLoading
                    ? const CircularProgressIndicator.adaptive()
                    : Text("Continue with Google",
                        style: context.textTheme.titleSmall),
                icon: Image.asset(
                  AssetConstants.googleLogo,
                  width: 24,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
