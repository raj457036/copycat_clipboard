import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:clipboard/common/color_schemes.dart';
import 'package:clipboard/constants/key.dart';
import 'package:clipboard/di/di.dart';
import 'package:clipboard/l10n/generated/app_localizations.dart';
import 'package:clipboard/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => sl()..fetchSession(),
        ),
        BlocProvider<AppConfigCubit>(
          create: (context) => sl()..load(),
        ),
        BlocProvider<SyncManagerCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<ClipboardCubit>(
          create: (context) => sl(),
        ),
      ],
      child: BlocListener<SyncManagerCubit, SyncManagerState>(
        listener: (context, state) {
          if (state is SyncedState) {
            context.read<ClipboardCubit>().fetch(fromTop: true);
          }
        },
        child: BlocSelector<AppConfigCubit, AppConfigState, ThemeMode>(
          selector: (state) {
            return state.maybeWhen(
              orElse: () => ThemeMode.system,
              loaded: (config) => config.themeMode,
            );
          },
          builder: (context, state) {
            return MaterialApp.router(
              scaffoldMessengerKey: scaffoldMessengerKey,
              routeInformationParser: router.routeInformationParser,
              routeInformationProvider: router.routeInformationProvider,
              routerDelegate: router.routerDelegate,
              backButtonDispatcher: router.backButtonDispatcher,
              themeMode: state,
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
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              builder: (context, child) => ResponsiveBreakpoints.builder(
                child: child!,
                breakpoints: [
                  const Breakpoint(start: 0, end: 450, name: MOBILE),
                  const Breakpoint(start: 451, end: 800, name: TABLET),
                  const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                  const Breakpoint(
                      start: 1921, end: double.infinity, name: '4K'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
