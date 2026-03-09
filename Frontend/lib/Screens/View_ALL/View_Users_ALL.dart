import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_clinic_system/Controllers/User_Controller.dart';
import 'package:medical_clinic_system/Screens/View_Single/View_User_Single.dart';

class UserListPage extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: Obx(() {
        if (userController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            columns: const [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('ID Number')),
            ],
            rows: userController.users.map((user) {
              return DataRow(
                cells: [
                  DataCell(Text(user.name)),
                  DataCell(Text(user.phone.toString())),
                ],
                onSelectChanged: (_) {
                  // Example on tap
                  Get.to(SingleUserView(user: user));
                },
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}