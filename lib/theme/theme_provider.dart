import 'package:flutter/material.dart';
import 'app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkTheme = true;
  Color textFildColorText = AppColors.white;
  Color bottomNavigationBar = AppColors.darkBgColor;
  Color textFildColorBeg = AppColors.darkTextFillColor;
  Color text = AppColors.white;
  Color textButtonNavigator = AppColors.green;
  Color screen = AppColors.darkBgColor;

  ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBgColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBgColor,
    ),
  );

  void changeTheme() {
    isDarkTheme = !isDarkTheme;
    theme = ThemeData(
      scaffoldBackgroundColor:
          isDarkTheme ? AppColors.darkBgColor : AppColors.lightBgColr,
      appBarTheme: AppBarTheme(
        backgroundColor:
            isDarkTheme ? AppColors.darkBgColor : AppColors.lightBgColr,
      ),
    );
    textFildColorText = isDarkTheme ? AppColors.white : AppColors.black;
    text = isDarkTheme ? AppColors.white : AppColors.black;
    bottomNavigationBar =
        isDarkTheme ? AppColors.darkBgColor : AppColors.lightBgColr;
    textFildColorBeg =
        isDarkTheme ? AppColors.darkTextFillColor : AppColors.textFildBeg;
    text = isDarkTheme ? AppColors.white : AppColors.black;
    textButtonNavigator =
        isDarkTheme ? AppColors.green : AppColors.bottonNavigator;
    screen = isDarkTheme ? AppColors.darkBgColor : AppColors.lightBgColr;
    notifyListeners();
  }
}
