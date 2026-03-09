
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_clinic_system/Controllers/ThemeController.dart';
import 'package:medical_clinic_system/MainScreen.dart';

void main() {
  // Inject the ThemeController before running the app
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the controller instance
    final ThemeController themeController = Get.find<ThemeController>();

    return Obx(
          () => GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light(), // Your light theme
        darkTheme: ThemeData.dark(), // Your dark theme
        themeMode: themeController.theme, // React to changes in themeController.theme
        home: const MainScreen(),
      ),
    );
  }
}