import 'package:flutter/material.dart';
import '../../data/models/history_model.dart';

class HistoryProvider with ChangeNotifier {
  final List<PurchaseHistory> _history = [];

  List<PurchaseHistory> get history => _history;

  void addMealToHistory(PurchaseHistory historyItem) {
    _history.add(historyItem);
    notifyListeners();
  }

  void addIngredientToHistory(PurchaseHistory historyItem) {
    _history.add(historyItem);
    notifyListeners();
  }
}
