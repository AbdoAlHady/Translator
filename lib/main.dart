import 'package:flutter/material.dart';
import 'package:translator_app/core/helper/env_variables.dart';
import 'package:translator_app/translator_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvVariables().init();
  runApp(const TranslatorApp());
}
