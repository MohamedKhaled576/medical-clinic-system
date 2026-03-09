
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_clinic_system/Controllers/Screen_Controller.dart';
import 'package:medical_clinic_system/Controllers/ThemeController.dart';
import 'package:medical_clinic_system/Screens/Create/Create_Patient.dart';
import 'package:medical_clinic_system/Screens/Create/Create_User.dart';
import 'package:medical_clinic_system/Screens/View_ALL/View_Patients_ALL.dart';
import 'package:medical_clinic_system/Screens/View_ALL/View_Users_ALL.dart';
import 'package:medical_clinic_system/Settings.dart';
import 'package:sidebar_with_animation/animated_side_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize your controller
    final ScreenController screenController = Get.put(ScreenController());
    final ThemeController themeController = Get.put(ThemeController());

    final List<Widget> pages = [
       UserListPage(),
       UserForm(),
       PatientForm(),
       PatientListPage(),
       Settings()
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("App with Side Menu"),
      ),
      body: Row(
        children: [
          SideBarAnimated(
            unSelectedTextColor: themeController.isDarkMode.value ? Colors.white : Colors.black,
            selectedIconColor: themeController.isDarkMode.value ? Colors.white : Colors.black,
            unselectedIconColor: themeController.isDarkMode.value ? Colors.white : Colors.black,
            sideBarColor: Colors.black12.withValues(alpha: 0.3), // Use a contrasting surface color
            textStyle: TextStyle(
              fontSize: 18,
              color: Theme.of(context).canvasColor,
            ),
            onTap: (index) {
              screenController.changePage(index);
            },
            sidebarItems: [
              SideBarItem(
                text: 'Users',
                iconSelected: Icons.people,
                iconUnselected: Icons.people_outline,
              ),
              SideBarItem(
                text: 'Create User',
                iconSelected: Icons.person_add,
                iconUnselected: Icons.person_add_outlined,
              ),
              SideBarItem(
                text: 'Create Patient',
                iconSelected: Icons.sick,
                iconUnselected: Icons.sick_outlined,
              ),
              SideBarItem(
                text: 'View Patients',
                iconSelected: Icons.local_hospital,
                iconUnselected: Icons.local_hospital_outlined,
              ),
              SideBarItem(
                text: 'Settings',
                iconSelected: Icons.settings,
                iconUnselected: Icons.settings_outlined,
              ),
            ], mainLogoImage: '', widthSwitch: 0.5,
          ),
          Expanded(
            child: Obx(() {
              // The main content area will reactively update
              // when the `selectedIndex` in the controller changes.
              return pages[screenController.selectedIndex.value];
            }),
          ),
        ],
      ),
    );
  }
}