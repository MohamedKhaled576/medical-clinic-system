import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_clinic_system/Controllers/ThemeController.dart';

class Settings extends StatelessWidget {
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:
      Obx(() => IconButton(
        icon: Icon(themeController.isDarkMode.value
            ? Icons.dark_mode
            : Icons.light_mode,
        ),
        onPressed: themeController.toggleTheme,
      )),),
    );
  }
}