
import 'package:flutter/material.dart';
import 'package:medical_clinic_system/Models/Med.dart';

class SingleMedView extends StatelessWidget {
  final Med med;

  const SingleMedView({super.key, required this.med});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medicine Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow("Medicine Name", med.name),
                _buildDetailRow("Price", med.price.toString()),
                _buildDetailRow("Stock", med.stock.toString()),
                _buildDetailRow(
                  "Created At",
                  med.createdAt != null
                      ? med.createdAt!.toLocal().toString().split(' ')[0]
                      : "N/A",
                ),
                _buildDetailRow(
                  "Updated At",
                  med.updatedAt != null
                      ? med.updatedAt!.toLocal().toString().split(' ')[0]
                      : "N/A",
                ),
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
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}