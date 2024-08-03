import 'package:copycat_base/bloc/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisableForLocalUser extends StatelessWidget {
  final Widget child;
  final Widget? ifLocal;
  const DisableForLocalUser({
    super.key,
    required this.child,
    this.ifLocal,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthCubit, AuthState, bool>(
      selector: (state) {
        return state is LocalAuthenticatedAuthState;
      },
      builder: (context, isLocalUser) {
        if (isLocalUser) return ifLocal ?? const SizedBox.shrink();
        return child;
      },
    );
  }
}
