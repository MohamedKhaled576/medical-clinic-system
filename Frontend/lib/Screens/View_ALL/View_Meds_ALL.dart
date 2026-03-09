import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_clinic_system/Controllers/Med_Controller.dart';
import 'package:medical_clinic_system/Screens/View_Single/View_Med_Single.dart';

class MedListPage extends StatelessWidget {
  final MedController medController = Get.put(MedController());

  MedListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medicines')),
      body: Obx(() {
        if (medController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            columns: const [
              DataColumn(label: Text('Medicine Name')),
              DataColumn(label: Text('Price')),
              DataColumn(label: Text('Stock')),
              DataColumn(label: Text('Created At')),
            ],
            rows: medController.meds.map((med) {
              return DataRow(
                cells: [
                  DataCell(Text(med.name)),
                  DataCell(Text(med.price.toString())),
                  DataCell(Text(med.stock.toString())),
                  DataCell(
                    Text(
                      med.createdAt != null
                          ? med.createdAt!
                          .toLocal()
                          .toString()
                          .split(' ')[0]
                          : '',
                    ),
                  ),
                ],
                onSelectChanged: (_) {
                  Get.to(SingleMedView(med: med));
                },
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}