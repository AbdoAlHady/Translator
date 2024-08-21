import 'package:flutter/material.dart';
import 'package:translator_app/core/routing/app_router.dart';
import 'package:translator_app/core/routing/routes.dart';

class TranslatorApp extends StatelessWidget {
  const TranslatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter().generateRoute,
      initialRoute: Routes.homeScreen,
    );
  }
}
