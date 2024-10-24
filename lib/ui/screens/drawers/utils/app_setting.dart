import 'package:flutter/material.dart';
import '../../../utils/colors_data.dart'; // Ensure AppColors is properly imported

class AppSettings extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system; // Default system theme
  bool _isListView = true; // Default view is ListView

  // Define custom light and dark themes using AppColors
  ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.accentColor,
      ),
      scaffoldBackgroundColor: AppColors.backgroundColor,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.textColor),
        bodyMedium: TextStyle(color: AppColors.textColor),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.secondaryColor,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.accentColor,
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.accentColor,
      ),
      scaffoldBackgroundColor: Colors.black,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.grey,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    );
  }

  ThemeMode get themeMode => _themeMode;
  bool get isListView => _isListView; // Getter for view mode (List or Grid)

  // Update the selected theme mode
  void updateThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  // Toggle between ListView and GridView
  void toggleViewMode() {
    _isListView = !_isListView;
    notifyListeners();
  }
}
