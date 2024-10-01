import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core/constants/app_strings.dart';
import 'core/utils/scroll_behavior.dart';
import 'routes/routes.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      key: Get.key,
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routerDelegate: goRoutePage.routerDelegate,
      backButtonDispatcher: goRoutePage.backButtonDispatcher,
      routeInformationParser: goRoutePage.routeInformationParser,
      routeInformationProvider: goRoutePage.routeInformationProvider,
      scrollBehavior: WebDragScrollBehavior(),
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1400, name: "SmallDesktop"),
            const Breakpoint(start: 1401, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        );
      },
    );
  }
}

///
