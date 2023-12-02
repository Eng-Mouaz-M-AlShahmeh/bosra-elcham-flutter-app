// Developed by Eng. Mouaz M. Al-Shahmeh
import 'dart:ui';
import 'package:bosra_elcham/src/application/app_riverpod.dart';
import 'package:bosra_elcham/src/application/app_routes.dart';
import 'package:bosra_elcham/src/data/firebase_options.dart';
import 'package:bosra_elcham/src/data/localization_service.dart';
import 'package:bosra_elcham/src/presentation/widgets/error_screen.dart';
import 'package:bosra_elcham/src/presentation/widgets/theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WakelockPlus.enable();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnglish = ref.watch(isEnglishProvider);
    if (ref.watch(networkAwareProvider) == NetworkStatus.off) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: isEnglish ? 'Bosra El-Cham City' : 'مدينة بصرى الشام',
        theme: themeData(),
        locale: isEnglish ? const Locale('en', 'US') : const Locale('ar', 'SY'),
        supportedLocales: const [Locale('ar', 'SY'), Locale('en', 'US')],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: const ErrorScreen(),
      );
    } else {
      return MaterialApp.router(
        locale: isEnglish ? const Locale('en', 'US') : const Locale('ar', 'SY'),
        supportedLocales: const [Locale('ar', 'SY'), Locale('en', 'US')],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        routeInformationProvider: router.routeInformationProvider,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        debugShowCheckedModeBanner: false,
        title: isEnglish ? 'Bosra El-Cham City' : 'مدينة بصرى الشام',
        theme: themeData(),
      );
    }
  }
}
