import 'package:flutter/material.dart';

class RouteAnimation {
  static Route slide(RouteSettings settings, Widget child) {
    return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, animation, secondaryAnimation) => child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const curve = Curves.ease;
          var tween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
              .chain(CurveTween(curve: curve));
          return SlideTransition(
            position: tween.animate(animation),
            child: child,
          );
        });
  }
}
