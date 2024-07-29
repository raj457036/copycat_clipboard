import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalSigninButton extends StatelessWidget {
  const LocalSigninButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        final cubit = context.read<AuthCubit>();
        cubit.localAuthenticated();
      },
      label: const Text("Use Locally"),
    );
  }
}
