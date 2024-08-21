import 'package:flutter/material.dart';
import 'package:translator_app/core/routing/routes.dart';
import 'package:translator_app/ui/screens/home_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return null;
    }
  }
}
