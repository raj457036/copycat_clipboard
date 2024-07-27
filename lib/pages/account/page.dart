import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/constants/numbers/breakpoints.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/widgets/dialogs/confirm_dialog.dart';
import 'package:clipboard/widgets/reset_password_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as su;
import 'package:url_launcher/url_launcher_string.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  Future<void> deleteAccount(BuildContext context) async {
    final answer = await ConfirmDialog(
      title: context.locale.accountDeleteDialogTitle,
      message: context.locale.accountDeleteDialogDesc,
    ).open(context);

    if (answer) {
      launchUrlString("https://forms.gle/TzAvgA935h8mYP5eA");
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isPhone = Breakpoints.isMobile(width);
    final colors = context.colors;
    final content = BlocSelector<AuthCubit, AuthState, su.User?>(
      selector: (state) {
        return state.mapOrNull(authenticated: (_) => _.user);
      },
      builder: (context, state) {
        if (state == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            ListTile(
              title: Text(context.locale.displayName),
              subtitle: Text(state.userMetadata?["display_name"] ?? ""),
            ),
            ListTile(
              title: Text(context.locale.email),
              subtitle: Text(state.email!),
            ),
            const Divider(),
            ListTile(
              title: Text(context.locale.accountSettings),
              subtitle: const Padding(
                padding: EdgeInsets.only(top: padding16),
                child: OverflowBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    ResetPasswordButton(iconButton: false),
                  ],
                ),
              ),
            ),
            const Divider(),
            ListTile(
              title: Text(context.locale.dangerZone),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: padding16),
                child: OverflowBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.remove_circle_outline_rounded),
                      onPressed: () => deleteAccount(context),
                      label: Text(context.locale.requestAccountDeletion),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colors.error,
                        foregroundColor: colors.onError,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(context.locale.myAccount),
      ),
      body: Align(
        alignment: isPhone ? Alignment.topCenter : Alignment.center,
        child: ConstrainedBox(
          constraints: BoxConstraints.loose(const Size(550, 400)),
          child: isPhone ? content : Card.outlined(child: content),
        ),
      ),
    );
  }
}
