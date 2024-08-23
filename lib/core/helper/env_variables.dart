import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvVariables {
  EnvVariables._();
  static final EnvVariables _instance = EnvVariables._();
  factory EnvVariables() => _instance;
  String _apiKey = '';

  // init
  Future<void> init() async {
    await dotenv.load(fileName: '.env');
    _apiKey = dotenv.get('API_KEY');
  }

  String get apiKey => _apiKey;
}
