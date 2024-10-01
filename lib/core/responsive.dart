import 'package:flutter/material.dart';

/// Widget for displaying different layouts based on screen size.
class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget smallDesktop;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.smallDesktop,
    required this.desktop,
  });

  static bool isMobileOrTablet(BuildContext context) => isMobile(context) || isTablet(context);

  /// Checks if the device is a mobile device.
  static bool isMobile(BuildContext context) => (MediaQuery.of(context).size.width <= 450);

  /// Checks if the device is a tablet.
  static bool isTablet(BuildContext context) => (MediaQuery.of(context).size.width >= 451 && MediaQuery.of(context).size.width <= 800);

  /// Checks if the device is a small desktop.
  static bool isSmallDesktop(BuildContext context) => (MediaQuery.of(context).size.width >= 801 && MediaQuery.of(context).size.width <= 1400);

  /// Checks if the device is a desktop.
  static bool isDesktop(BuildContext context) => (MediaQuery.of(context).size.width >= 1401);

  @override
  Widget build(BuildContext context) {
    /// Determine the appropriate layout based on screen size
    if (isMobile(context)) {
      return mobile; // Return mobile layout
    } else if (isTablet(context)) {
      return tablet; // Return tablet layout
    } else if (isSmallDesktop(context)) {
      return smallDesktop; // Return small desktop layout
    } else {
      return desktop; // Return desktop layout
    }
  }
}
