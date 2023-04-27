import 'package:flutter/material.dart';

class Utils {
  static Utils utils = Utils();

  /// Get instance method for util class
  /// Returns an instance of Util
  static Utils getInstance() {
    return utils;
  }

  // +++++++++++++++++++++++++
  // NAVIGATION
  // +++++++++++++++++++++++++

  void navigate(
    BuildContext context,
    Widget screen,
  ) {
    Navigator.of(context).push(
      _createAnimatedRoute(
        context,
        screen,
      ),
    );
  }

  Route _createAnimatedRoute(
    BuildContext context,
    Widget page2,
  ) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page2,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
