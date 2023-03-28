import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/init/lang/language_manager.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/theme/app_theme.dart';

void main() async {
  await _init();
  runApp(EasyLocalization(
    supportedLocales: LanguageManager.instance.supportedLocales,
    path: LanguageManager.instance.langAssetPath,
    child: const MyApp(),
  ));
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  //await Hive.initFlutter();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationService = NavigationService.instance;
    return MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: 'Placars',
        theme: AppThemeLight.instance.themeData,
        routeInformationParser: navigationService.router.routeInformationParser,
        routeInformationProvider: navigationService.router.routeInformationProvider,
        routerDelegate: navigationService.router.routerDelegate);
  }
}
