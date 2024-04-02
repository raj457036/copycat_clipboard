import 'package:clipboard/common/color_schemes.dart';
import 'package:clipboard/constants/key.dart';
import 'package:clipboard/di/di.dart';
import 'package:clipboard/l10n/generated/app_localizations.dart';
import 'package:clipboard/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common/bloc_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.robotoTextTheme();
    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessengerKey,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      backButtonDispatcher: router.backButtonDispatcher,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: textTheme.apply(
          bodyColor: lightColorScheme.onSurface,
          displayColor: lightColorScheme.onSurface,
        ),
        colorScheme: lightColorScheme,
        brightness: Brightness.light,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        textTheme: textTheme.apply(
          bodyColor: darkColorScheme.onSurface,
          displayColor: darkColorScheme.onSurface,
        ),
        colorScheme: darkColorScheme,
        brightness: Brightness.dark,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
