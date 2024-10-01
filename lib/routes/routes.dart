import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/core/constants/app_colors.dart';
import 'package:task_app/routes/routes_name.dart';
import 'package:task_app/views/dashboard/dashboard_controller.dart';
import 'package:task_app/views/dashboard/dashboard_view.dart';

import '../core/utils/color_print.dart';

/// Manages all the routes for the application using GoRouter.
final goRoutePage = GoRouter(
  initialLocation: RoutesName.initialRoute,
  redirect: (context, state) {
    printGreen("redirect: ${state.fullPath}");
    return null;
  },
  routes: [
    /// Authentication routes
    goRoute(
      name: RoutesName.dashboard,
      path: RoutesName.dashboardPath,
      pageBuilder: (context, state) {
        return NoTransitionPage(
          child: GetBuilder(builder: (controller) => const DashboardView(), init: DashboardController()),
        );
      },
    ),
  ],
);

/// Creates a GoRoute object for a route.
GoRoute goRoute({
  required String name,
  required String path,
  Page<dynamic> Function(BuildContext, GoRouterState)? pageBuilder,
  List<RouteBase>? routes,
}) {
  return GoRoute(
    name: name,
    path: path,
    pageBuilder: pageBuilder,
    routes: routes ?? [],
  );
}

/// Builds a page for route navigation with a transition animation.
Page<dynamic> Function(BuildContext, GoRouterState)? pageBuilder(Widget child) {
  return (context, state) {
    return CustomTransitionPage<void>(
      child: child,
      opaque: false,
      key: state.pageKey,
      barrierDismissible: true,
      barrierColor: AppColors.primaryColor,
      transitionDuration: const Duration(milliseconds: 100),
      reverseTransitionDuration: const Duration(milliseconds: 100),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  };
}
