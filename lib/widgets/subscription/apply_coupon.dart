import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
                controller: couponController,
                decoration: const InputDecoration(
                  labelText: 'Coupon Code',
                  helperText: 'Enter your coupon code',
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Apply'),
        ),
      ],
    );
  }
}
