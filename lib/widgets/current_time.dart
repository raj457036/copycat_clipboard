import 'dart:async';

import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:flutter/material.dart';

class CurentTime extends StatefulWidget {
  const CurentTime({super.key});

  @override
  State<CurentTime> createState() => _CurentTimeState();
}

class _CurentTimeState extends State<CurentTime> {
  late final Timer timer;
  DateTime currentTime = now();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card.filled(
        child: Padding(
          padding: const EdgeInsets.all(padding12),
          child: Wrap(
            runAlignment: WrapAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(padding16),
                child: Text("Local: $currentTime"),
              ),
              Padding(
                padding: const EdgeInsets.all(padding16),
                child: Text("UTC: ${currentTime.toUtc()}"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
