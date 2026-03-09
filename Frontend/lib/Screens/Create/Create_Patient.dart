
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_clinic_system/Controllers/Patient_Controller.dart';
import 'package:medical_clinic_system/Models/Patient.dart';
import 'package:medical_clinic_system/Models/Reservation.dart';

class PatientForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PatientController patientController = Get.put(PatientController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController phonenumber2Controller = TextEditingController();
  final TextEditingController locationaddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Patient')),
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
                        labelText: 'Patient Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Patient Name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: phonenumberController,
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
                    TextFormField(
                      controller: phonenumber2Controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: locationaddressController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Location Address',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Location Address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Text('Reservations', style: Get.textTheme.titleLarge),
                    SizedBox(height: 10),
                    // Loop through the observable list of reservations
                    ...patientController.reservations.asMap().entries.map((entry) {
                      final index = entry.key;
                      final reservation = entry.value;
                      return _buildReservationForm(index, reservation);
                    }).toList(),
                    SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: patientController.addReservation,
                      icon: Icon(Icons.add),
                      label: Text('Add Reservation'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final patient = Patient(
                            name: nameController.text.trim(),
                            phonenumber: phonenumberController.text.trim(),
                            phonenumber2: phonenumber2Controller.text.trim(),
                            locationaddress: locationaddressController.text.trim(),
                          );
                          patientController.createPatient(patient);
                        }
                      },
                      child: Text('Create a New Patient'),
                    ),
                  ],
                ),
              ),
            ),
            if (patientController.isLoading.value)
              Container(
                color: Colors.black45,
                child: Center(child: CircularProgressIndicator()),
              ),
          ],
        );
      }),
    );
  }

  // Helper widget to build a single reservation form row
  Widget _buildReservationForm(int index, Reservation reservation) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: reservation.title,
              decoration: InputDecoration(
                labelText: 'Reservation Title',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // Update the title of the reservation in the observable list
                patientController.reservations[index] = Reservation(
                  title: value,
                  date: reservation.date,
                );
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Title is required';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            // Display and pick date
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(
                'Date: ${reservation.date.toLocal().toString().split(' ')[0]}',
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => patientController.removeReservation(index),
              ),
              onTap: () async {
                final selectedDate = await Get.dialog<DateTime>(
                  DatePickerDialog(
                    initialDate: reservation.date,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  ),
                );
                if (selectedDate != null) {
                  patientController.reservations[index] = Reservation(
                    title: reservation.title,
                    date: selectedDate,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

