import 'package:flutter/material.dart';
import 'package:mealdbproject/app.dart';
import 'package:mealdbproject/ui/widget/history_provider.dart';
import 'package:provider/provider.dart';
import 'ui/screens/drawers/utils/app_setting.dart';
import 'ui/widget/ingredient_provider.dart';
import 'ui/widget/meal_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MealProvider()),
        ChangeNotifierProvider(create: (_) => IngredientProvider()),
        ChangeNotifierProvider(create: (_) => AppSettings()),
        ChangeNotifierProvider(create: (_) => HistoryProvider()),
      ],
      child: const MealProduceApp(),
    ),
  );
}




