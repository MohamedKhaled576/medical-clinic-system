import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_clinic_system/Api/ApiService.dart';
import 'package:medical_clinic_system/Models/User.dart';

class UserController extends GetxController {
  final users = <User>[].obs;
  final isLoading = false.obs;
  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      users.value = await _apiService.fetchUsers();
    } catch (e) {
      Get.defaultDialog(
        title: "Alert",
        content: Text("Can't connect to server"),
        textCancel: "Exit",
        cancelTextColor: Colors.white,
        textConfirm: "Refresh",
        confirmTextColor: Colors.white,
        onCancel: () => exit(0),
        onConfirm: () => fetchUsers(),
        barrierDismissible: false,
        backgroundColor: Colors.red,
      );
    }
  }

  void createUser(User user) async {
    final statusCode = await _apiService.createUser(user);

    if (statusCode == 201) {
      Get.defaultDialog(
        title: "Done",
        content: Text("User Created (200 OK)"),
        barrierDismissible: true,
        backgroundColor: Colors.green,
      );
      fetchUsers();
    } else {
      Get.defaultDialog(
        title: "Error",
        content: Text("Failed to create user: $statusCode"),
        barrierDismissible: true,
        backgroundColor: Colors.red,
      );
    }
  }
}