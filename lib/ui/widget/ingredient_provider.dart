import 'package:flutter/material.dart';
import '../../data/models/ingredient_model.dart';

class IngredientProvider with ChangeNotifier {
  final Map<Ingredient, int> _cart = {};
  final List<Map<String, dynamic>> _purchaseHistory = [];

  Map<Ingredient, int> get cart => _cart;
  List<Map<String, dynamic>> get purchaseHistory => _purchaseHistory;

  void addToCart(Ingredient ingredient, int quantity) {
    if (_cart.containsKey(ingredient)) {
      _cart[ingredient] = _cart[ingredient]! + quantity;
    } else {
      _cart[ingredient] = quantity;
    }
    notifyListeners();
  }

  void removeFromCart(Ingredient ingredient) {
    _cart.remove(ingredient);
    notifyListeners();
  }

  void purchaseIngredient(Ingredient ingredient) {
    if (_cart.containsKey(ingredient)) {
      _purchaseHistory.add({
        'item': ingredient,
        'purchaseDate': DateTime.now(),
        'price': ingredient.price,
        'unit': _cart[ingredient],
      });
      removeFromCart(ingredient);
      notifyListeners();
    }
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  final List<Ingredient> _favoriteIngredients = [];
  List<Ingredient> get favorites => _favoriteIngredients;

  bool isFavorite(Ingredient ingredient) {
    return _favoriteIngredients.contains(ingredient);
  }

  void addFavorite(Ingredient ingredient) {
    if (!_favoriteIngredients.contains(ingredient)) {
      _favoriteIngredients.add(ingredient);
      notifyListeners();
    }
  }

  void removeFavorite(Ingredient ingredient) {
    _favoriteIngredients.remove(ingredient);
    notifyListeners();
  }
}
