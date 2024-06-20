import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/snackbar.dart';
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
      showTextSnackbar("Subscription Updated");
      if (mounted) {
        context.pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return AlertDialog(
      title: const Text(
        'Apply Coupon',
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        width: 450,
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  "Beta • Invite Only",
                  style: textTheme.titleMedium?.copyWith(
                    color: Colors.deepOrange,
                  ),
                ),
                subtitle: Text.rich(
                  TextSpan(
                      text:
                          "CopyCat Clipboard Pro is currently available by invitation only. We are diligently working to make it accessible to everyone soon. ",
                      children: [
                        TextSpan(
                          text: "\nApply for an invitation here.",
                          style: textTheme.bodyMedium?.copyWith(
                            color: Colors.deepOrange,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = applyForPro,
                        )
                      ]),
                ),
              ),
              height10,
              TextFormField(
                enabled: !loading,
                controller: couponController,
                decoration: InputDecoration(
                  labelText: 'Coupon Code',
                  helperText: 'Enter your coupon code',
                  errorText: errorMessage,
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: loading ? null : () => context.pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: loading ? null : apply,
          child: const Text('Apply'),
        ),
      ],
    );
  }
}
