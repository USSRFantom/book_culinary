import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get apiUrl => dotenv.env['https://www.themealdb.com/'] ?? '';

  static String get apiMeals => dotenv.env['https://www.themealdb.com/'] ?? '';
}
