import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_clinic_system/Controllers/Patient_Controller.dart';
import 'package:medical_clinic_system/Screens/View_Single/View_Patient_Single.dart';

class PatientListPage extends StatelessWidget {
  final PatientController patientController = Get.put(PatientController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Patients')),
      body: Obx(() {
        if (patientController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            columns: const [
              DataColumn(label: Text('Patient Name')),
              DataColumn(label: Text('Phone Number 1')),
              DataColumn(label: Text('Phone Number 2')),
              DataColumn(label: Text('Location Address')),
            ],
            rows: patientController.patients.map((patient) {
              return DataRow(
                cells: [
                  DataCell(Text(patient.name)),
                  DataCell(Text(patient.phonenumber.toString())),
                  DataCell(Text(patient.phonenumber2.toString())),
                  DataCell(Text(patient.locationaddress.toString())),
                ],
                onSelectChanged: (_) {
                  // Example on tap
                  Get.to(SinglePatientView(patient: patient));
                },
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}