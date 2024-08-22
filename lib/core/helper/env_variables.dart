import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvVariables {
  EnvVariables._();
  static final EnvVariables _instance = EnvVariables._();
  factory EnvVariables() => _instance;
  String _apiToken = '';

  // init
  Future<void> init() async {
    await dotenv.load(fileName: '.env');
    _apiToken = dotenv.get('API_TOKEN');
  }

  String get apiToken => _apiToken;
}
