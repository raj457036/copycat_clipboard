import 'package:clipboard/bloc/monetization_cubit/monetization_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/routes/routes.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ApplyCouponDialog extends StatefulWidget {
  const ApplyCouponDialog({super.key});

  Future<void> open(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => this,
      barrierDismissible: false,
    );
  }

  @override
  State<ApplyCouponDialog> createState() => _ApplyCouponDialogState();
}

class _ApplyCouponDialogState extends State<ApplyCouponDialog> {
  String? errorMessage;
  bool loading = false;
  late final TextEditingController couponController;

  @override
  void initState() {
    super.initState();
    couponController = TextEditingController();
  }

  @override
  void dispose() {
    couponController.dispose();
    super.dispose();
  }

  Future<void> applyForPro() async {
    const betaProForm = "https://forms.gle/iuX3XDrvMJPLLtix5";
    launchUrlString(betaProForm);
  }

  Future<void> apply() async {
    final cubit = context.read<MonetizationCubit>();
    setState(() {
      loading = true;
    });
    final failure = await cubit.applyPromoCode(couponController.text);
    if (failure != null) {
      setState(() {
        errorMessage = failure.message;
        loading = false;
      });
    } else {
      if (isAnalyticsSupported) {
        analytics.logEvent(
          name: "Apply Promo Code",
          parameters: {
            "promo_code": couponController.text,
          },
        );
      }
      if (context.mounted) {
        // ignore: use_build_context_synchronously
        showTextSnackbar(context.locale.subscriptionUpdated);
      }
      if (mounted) {
        context.pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        context.locale.grantedEntitlement,
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        width: 450,
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text.rich(
                TextSpan(
                  text: context.locale.grantedEntitlementDesc,
                  children: [
                    TextSpan(
                      text: context.locale.clickingHere,
                      style: const TextStyle(
                        color: Colors.deepOrange,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = applyForPro,
                    ),
                  ],
                ),
              ),
              height16,
              TextFormField(
                enabled: !loading,
                controller: couponController,
                decoration: InputDecoration(
                  labelText: "Code",
                  helperText: context.locale.enterCodeSubmit,
                  errorText: errorMessage,
                ),
              ),
            ],
          ),
        ),
      ),
      contentPadding: const EdgeInsets.only(
        top: 16,
        bottom: 0,
        left: 16,
        right: 16,
      ),
      actions: [
        TextButton(
          onPressed: loading ? null : () => context.pop(),
          child: Text(context.locale.cancel),
        ),
        TextButton(
          onPressed: loading ? null : apply,
          child: Text(context.locale.submit),
        ),
      ],
    );
  }
}
