
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_clinic_system/Controllers/Med_Controller.dart';
import 'package:medical_clinic_system/Models/Med.dart';

class MedForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final MedController medController = Get.put(MedController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();

  MedForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Medicine')),
      body: Obx(() {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      /// Medicine Name
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Medicine Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter medicine name';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),

                      /// Price
                      TextFormField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Price',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter price';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),

                      /// Stock
                      TextFormField(
                        controller: stockController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Stock Quantity',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter stock';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      /// Sales Section
                      Text(
                        'Sales',
                        style: Get.textTheme.titleLarge,
                      ),

                      const SizedBox(height: 10),

                      ...medController.sales
                          .asMap()
                          .entries
                          .map((entry) {
                        final index = entry.key;
                        final sale = entry.value;
                        return _buildSaleForm(index, sale);
                      }).toList(),

                      const SizedBox(height: 10),

                      ElevatedButton.icon(
                        onPressed: medController.addSale,
                        icon: const Icon(Icons.add),
                        label: const Text('Add Sale'),
                      ),

                      const SizedBox(height: 20),

                      /// Create Button
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final med = Med(
                              name: nameController.text.trim(),
                              price: double.parse(priceController.text),
                              stock: int.parse(stockController.text),
                            );

                            medController.createMed(med);
                          }
                        },
                        child: const Text('Create Medicine'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Loading overlay
            if (medController.isLoading.value)
              Container(
                color: Colors.black45,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        );
      }),
    );
  }

  /// Sale Row Widget
  Widget _buildSaleForm(int index, Sale sale) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextFormField(
              initialValue: sale.quantity.toString(),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                medController.sales[index] = Sale(
                  quantity: int.tryParse(value) ?? 0,
                  total: sale.total,
                  medId: sale.medId,
                );
              },
            ),

            const SizedBox(height: 10),

            TextFormField(
              initialValue: sale.total.toString(),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Total Price',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                medController.sales[index] = Sale(
                  quantity: sale.quantity,
                  total: double.tryParse(value) ?? 0,
                  medId: sale.medId,
                );
              },
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => medController.removeSale(index),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}