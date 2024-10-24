import 'package:flutter/material.dart';
import '../../data/models/meal_model.dart';

class MealProvider with ChangeNotifier {
  final List<Meal> _favorites = [];
  final Map<Meal, int> _cart = {};
  final List<Map<String, dynamic>> _purchaseHistory = [];

  List<Meal> get favorites => _favorites;
  Map<Meal, int> get cart => _cart;
  List<Map<String, dynamic>> get purchaseHistory => _purchaseHistory;

  void toggleFavorite(Meal meal) {
    if (_favorites.contains(meal)) {
      _favorites.remove(meal);
    } else {
      if (_favorites.length < 50) { // Limit the number of favorite meals (optional)
        _favorites.add(meal);
      }
    }
    notifyListeners();
  }

  void addToCart(Meal meal, int quantity) {
    if (_cart.containsKey(meal)) {
      _cart[meal] = _cart[meal]! + quantity;
    } else {
      _cart[meal] = quantity;
    }
    notifyListeners();
  }

  void removeFromCart(Meal meal) {
    _cart.remove(meal);
    notifyListeners();
  }

  void purchaseMeal(Meal meal) {
    if (_cart.containsKey(meal)) {
      _purchaseHistory.add({
        'item': meal,
        'purchaseDate': DateTime.now(),
        'price': meal.price,
        'unit': 1,
      });

      removeFromCart(meal);
      notifyListeners();
    }
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  bool isInCart(Meal meal) {
    return _cart.containsKey(meal);
  }

  List<Map<String, dynamic>> get mealPurchaseHistory => _purchaseHistory;

  bool isFavorite(Meal meal) {
    return _favorites.contains(meal);
  }
}
