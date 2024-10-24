import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/meal_model.dart';
import '../models/ingredient_model.dart';

class MealService {
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  // Fetch default meals when the app starts (e.g., chicken meals)
  static Future<List<Meal>> fetchDefaultMeals() async {
    final response = await http.get(Uri.parse('$baseUrl/search.php?s='));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['meals'] != null) {
        return List<Meal>.from(data['meals'].map((meal) => Meal.fromJson(meal)));
      }
      return [];
    } else {
      throw Exception('Failed to load meals');
    }
  }

  // Search meals based on the user's query
  static Future<List<Meal>> searchMeals(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/search.php?s=$query'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      if (data['meals'] != null) {
        return List<Meal>.from(data['meals'].map((meal) => Meal.fromJson(meal)));
      }
      return [];
    } else {
      throw Exception('Failed to load meals');
    }
  }

  // Fetch ingredients
  static Future<List<Ingredient>> fetchDefaultIngredients() async {
    final response = await http.get(Uri.parse('$baseUrl/list.php?i=list'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      if (data['meals'] != null) {
        return List<Ingredient>.from(data['meals'].map((ing) => Ingredient.fromJson(ing)));
      }
      return [];
    } else {
      throw Exception('Failed to load ingredients');
    }
  }

  // Search ingredients based on the user's query
  static Future<List<Ingredient>> searchIngredients(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/filter.php?i=$query'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['meals'] != null) {
        return List<Ingredient>.from(data['meals'].map((ing) => Ingredient.fromJson(ing)));
      }
      return [];
    } else {
      throw Exception('Failed to load ingredients');
    }
  }
}
