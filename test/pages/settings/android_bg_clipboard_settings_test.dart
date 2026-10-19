import 'dart:async';
import 'dart:ui' as ui;

import 'package:android_background_clipboard/android_background_clipboard.dart';
import 'package:clipboard/base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/base/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/base/bloc/monetization_cubit/monetization_cubit.dart';
import 'package:clipboard/base/l10n/generated/app_localizations.dart';
import 'package:clipboard/pages/settings/pages/android_bg_clipboard/android_bg_clipboard_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeAuthCubit extends Fake implements AuthCubit {
  @override
  AuthState get state => const AuthState.unknown();

  @override
  Stream<AuthState> get stream => const Stream.empty();
}

class _FakeAppConfigCubit extends Fake implements AppConfigCubit {
  @override
  Stream<AppConfigState> get stream => const Stream.empty();
}

class _FakeMonetizationCubit extends Fake implements MonetizationCubit {
  @override
  Stream<MonetizationState> get stream => const Stream.empty();
}

class _FakeBackgroundClipboard extends Fake
    implements AndroidBackgroundClipboard {
  final initialization = Completer<void>();
  bool optimizationEnabled = true;
  int requests = 0;
  int settingsOpened = 0;
  Future<bool> Function()? readOptimization;
  Completer<void>? permissionRequest;

  @override
  Future<void> initStorage() => initialization.future;

  @override
  Future<bool> isNotificationPermissionGranted() async => true;

  @override
  Future<bool> isAccessibilityPermissionGranted() async => false;

  @override
  Future<bool> isServiceRunning() async => false;

  @override
  Future<bool> isBatteryOptimizationEnabled() async => readOptimization == null
      ? optimizationEnabled
      : await readOptimization!();

  @override
  Future<void> setDetectionMode(String mode) async {}

  @override
  Future<void> requestUnrestrictedBatteryAccess() async {
    requests++;
    await permissionRequest?.future;
  }

  @override
  Future<void> openBatteryOptimizationSetting() async {
    settingsOpened++;
  }
}

void main() {
  late _FakeBackgroundClipboard plugin;

  Future<void> showSettings(WidgetTester tester) async {
    plugin = _FakeBackgroundClipboard();
    // Keep configuration setup pending to isolate permission navigation.
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>.value(value: _FakeAuthCubit()),
          BlocProvider<AppConfigCubit>.value(value: _FakeAppConfigCubit()),
          BlocProvider<MonetizationCubit>.value(
            value: _FakeMonetizationCubit(),
          ),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: AndroidBgClipboardSettings(
            bgService: plugin,
            deviceId: 'test-device',
            liteMode: true,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    tester.binding.handleViewFocusChanged(
      ui.ViewFocusEvent(
        viewId: tester.view.viewId,
        state: ui.ViewFocusState.focused,
        direction: ui.ViewFocusDirection.undefined,
      ),
    );
    await tester.pumpAndSettle();
  }

  SwitchListTile batteryTile(WidgetTester tester) => tester
      .widgetList<SwitchListTile>(find.byType(SwitchListTile))
      .elementAt(1);

  testWidgets('refreshes battery exemption when only window focus returns', (
    tester,
  ) async {
    await showSettings(tester);
    expect(batteryTile(tester).value, isFalse);

    plugin.optimizationEnabled = false;
    tester.binding.handleViewFocusChanged(
      ui.ViewFocusEvent(
        viewId: tester.view.viewId,
        state: ui.ViewFocusState.focused,
        direction: ui.ViewFocusDirection.undefined,
      ),
    );
    await tester.pumpAndSettle();

    expect(batteryTile(tester).value, isTrue);
    expect(tester.takeException(), isNull);
  });

  testWidgets('stale unchecked tile refreshes without reopening settings', (
    tester,
  ) async {
    await showSettings(tester);
    plugin.optimizationEnabled = false;

    await tester.tap(find.byType(SwitchListTile).at(1));
    await tester.pumpAndSettle();

    expect(plugin.settingsOpened, 0);
    expect(plugin.requests, 0);
    expect(batteryTile(tester).value, isTrue);
  });

  testWidgets('updates after battery settings close without lifecycle events', (
    tester,
  ) async {
    await showSettings(tester);
    plugin.permissionRequest = Completer<void>();
    await tester.tap(find.byType(SwitchListTile).at(1));
    await tester.pumpAndSettle();
    expect(batteryTile(tester).value, isFalse);

    plugin.optimizationEnabled = false;
    plugin.permissionRequest!.complete();
    await tester.pumpAndSettle();

    expect(batteryTile(tester).value, isTrue);
    expect(plugin.requests, 1);
    expect(plugin.settingsOpened, 0);
  });

  testWidgets('requests exemption when battery optimization is enabled', (
    tester,
  ) async {
    await showSettings(tester);

    await tester.tap(find.byType(SwitchListTile).at(1));
    await tester.pumpAndSettle();

    expect(plugin.requests, 1);
    expect(plugin.settingsOpened, 0);
    expect(batteryTile(tester).value, isFalse);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('rechecks delayed permission propagation without another tap', (
    tester,
  ) async {
    await showSettings(tester);
    plugin.permissionRequest = Completer<void>();
    await tester.tap(find.byType(SwitchListTile).at(1));
    await tester.pumpAndSettle();
    plugin.permissionRequest!.complete();
    await tester.pumpAndSettle();
    expect(batteryTile(tester).value, isFalse);

    await tester.pump(const Duration(milliseconds: 500));
    plugin.optimizationEnabled = false;
    await tester.pump(const Duration(milliseconds: 250));
    await tester.pumpAndSettle();

    expect(batteryTile(tester).value, isTrue);
    expect(plugin.requests, 1);
    expect(plugin.settingsOpened, 0);
  });

  testWidgets('stops rechecking after five seconds when permission is denied', (
    tester,
  ) async {
    await showSettings(tester);
    var reads = 0;
    plugin.readOptimization = () async {
      reads++;
      return true;
    };
    await tester.tap(find.byType(SwitchListTile).at(1));
    await tester.pumpAndSettle();
    for (var i = 0; i < 20; i++) {
      await tester.pump(const Duration(milliseconds: 250));
    }
    final readsAfterTimeout = reads;
    await tester.pump(const Duration(seconds: 2));

    expect(reads, readsAfterTimeout);
    expect(batteryTile(tester).value, isFalse);
  });

  testWidgets('older status reads cannot overwrite a newer refresh', (
    tester,
  ) async {
    await showSettings(tester);
    final olderRead = Completer<bool>();
    final newerRead = Completer<bool>();
    plugin.readOptimization = () => olderRead.future;
    tester.binding.handleViewFocusChanged(
      ui.ViewFocusEvent(
        viewId: tester.view.viewId,
        state: ui.ViewFocusState.focused,
        direction: ui.ViewFocusDirection.undefined,
      ),
    );
    await tester.pump();

    plugin.readOptimization = () => newerRead.future;
    tester.binding.handleViewFocusChanged(
      ui.ViewFocusEvent(
        viewId: tester.view.viewId,
        state: ui.ViewFocusState.focused,
        direction: ui.ViewFocusDirection.undefined,
      ),
    );
    await tester.pump();

    newerRead.complete(false);
    await tester.pumpAndSettle();
    expect(batteryTile(tester).value, isTrue);

    olderRead.complete(true);
    await tester.pumpAndSettle();
    expect(batteryTile(tester).value, isTrue);
  });
}
