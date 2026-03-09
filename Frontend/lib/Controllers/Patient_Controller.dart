import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_clinic_system/Api/ApiService.dart';
import 'package:medical_clinic_system/Models/Patient.dart';
import 'package:medical_clinic_system/Models/Reservation.dart';

class PatientController extends GetxController {
  final patients = <Patient>[].obs;
  final isLoading = false.obs;
  var reservations = <Reservation>[].obs;
  final ApiService _apiService = ApiService();

  void addReservation() {
    reservations.add(Reservation(title: '', date: DateTime.now()));
  }
  void removeReservation(int index) {
    reservations.removeAt(index);
  }

  @override
  void onInit() {
    fetchPatients();
    super.onInit();
  }

  void fetchPatients() async {
    try {
      patients.value = await _apiService.fetchPatients();
    } catch (e) {
      Get.defaultDialog(
        title: "Alert",
        content: Text("Can't connect to server"),
        textCancel: "Exit",
        cancelTextColor: Colors.white,
        textConfirm: "Refresh",
        confirmTextColor: Colors.white,
        onCancel: () => exit(0),
        onConfirm: () => fetchPatients(),
        barrierDismissible: false,
        backgroundColor: Colors.red,
      );
    }
  }

  void createPatient(Patient patient) async {
    final statusCode = await _apiService.createPatient(patient);

    if (statusCode == 201) {
      Get.defaultDialog(
        title: "Done",
        content: Text("User Created (200 OK)"),
        barrierDismissible: true,
        backgroundColor: Colors.green,
      );
      fetchPatients();
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