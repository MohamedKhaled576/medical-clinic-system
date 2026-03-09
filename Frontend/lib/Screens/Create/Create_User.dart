
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_clinic_system/Controllers/User_Controller.dart';
import 'package:medical_clinic_system/Models/User.dart';

class UserForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserController userController = Get.put(UserController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create User')),
      body: Obx(() {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter User Name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Phone Number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final user = User(
                            name: nameController.text.trim(),
                            phone: phoneController.text.trim(),
                          );
                          userController.createUser(user);
                        }
                      },
                      child: Text('Create a New User'),
                    ),
                  ],
                ),
              ),
            ),
            if (userController.isLoading.value)
              Container(
                color: Colors.black45,
                child: Center(child: CircularProgressIndicator()),
              ),
          ],
        );
      }),
    );
  }
}