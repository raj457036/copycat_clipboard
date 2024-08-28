import 'dart:io';

import 'package:flutter/foundation.dart';

Future<String> shellOut(String command) async {
  final result = await Process.run(
      Platform.environment['SHELL'] ?? "/bin/bash", ['-c', command]);
  return result.stdout.toString();
}

Future<String> runInPowershell(List<String> commands) async {
  final result = await Process.run(
    'powershell.exe',
    ['-ExecutionPolicy', 'Bypass', ...commands],
  );
  if (kDebugMode) {
    print(result.stderr);
  }
  return result.stdout.toString();
}
