import 'package:flutter/material.dart';
import 'package:translator_app/core/routing/routes.dart';
import 'package:translator_app/ui/screens/home_screen.dart';
import 'package:translator_app/ui/screens/translation_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.translatorScreen:
        return MaterialPageRoute(builder: (_) => const TranslationScreen());
      default:
        return null;
    }
  }
}
