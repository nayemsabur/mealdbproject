import 'package:flutter/material.dart';
import 'package:mealdbproject/ui/screens/bottom_navbar/bottom_nav_bar.dart';
import 'package:mealdbproject/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'ui/screens/drawers/utils/app_setting.dart';
import 'ui/utils/colors_data.dart';

class MealProduceApp extends StatefulWidget {
  static var navigatorKey;

  const MealProduceApp({super.key});

  @override
  State<MealProduceApp> createState() => _MealProduceAppState();
}

class _MealProduceAppState extends State<MealProduceApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppSettings>(
      create: (_) => AppSettings(),
      child: Consumer<AppSettings>(
        builder: (context, settings, child) {
          return MaterialApp(
            themeMode: settings.themeMode,
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData.dark(),
            theme: ThemeData(
              colorSchemeSeed: AppColors.secondaryColor,
              cardColor: AppColors.themeColor,
              textTheme: const TextTheme(),
              inputDecorationTheme: _inputDecorationTheme(),
              elevatedButtonTheme: _elevatedButtonThemeData(),
            ),
            home: const MainNavBar(),
          );
        },
      ),
    );
  }

  ElevatedButtonThemeData _elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.themeColor,
        fixedSize: const Size.fromWidth(double.maxFinite),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      border: _inputBorder(),
      errorBorder: _inputBorder(),
      focusedBorder: _inputBorder(),
      enabledBorder: _inputBorder(),
    );
  }

  OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    );
  }
}
