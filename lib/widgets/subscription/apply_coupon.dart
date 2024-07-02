import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
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
    final cubit = context.read<AuthCubit>();
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
      showTextSnackbar("Subscription Updated");
      if (mounted) {
        context.pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Granted Entitlement',
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
                  text: "Granted Entitlement Codes are shared with specific"
                      " individuals for custom entitlements. You can check if"
                      " invitations are still available by ",
                  children: [
                    TextSpan(
                      text: "clicking here.",
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
                  helperText: 'Enter the code and press Submit',
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
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: loading ? null : apply,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
