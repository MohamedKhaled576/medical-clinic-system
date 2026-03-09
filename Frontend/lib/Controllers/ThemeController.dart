import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  // Use a reactive variable to track the theme mode
  RxBool isDarkMode = true.obs;

  ThemeMode get theme => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    // Explicitly tell GetX to change the app's theme mode
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}