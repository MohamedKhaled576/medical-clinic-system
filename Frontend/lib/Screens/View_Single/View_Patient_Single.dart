
import 'package:flutter/material.dart';
import 'package:medical_clinic_system/Models/Patient.dart';

class SinglePatientView extends StatelessWidget {
  final Patient patient;

  const SinglePatientView({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patient Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow("Name", patient.name),
                _buildDetailRow("Phone Number", patient.phonenumber),
                _buildDetailRow("Phone Number 2", patient.phonenumber2!),
                _buildDetailRow("Location Address", patient.locationaddress),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}