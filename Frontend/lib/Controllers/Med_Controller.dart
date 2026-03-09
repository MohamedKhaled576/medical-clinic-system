
import 'package:get/get.dart';
import 'package:medical_clinic_system/Models/Med.dart';

class MedController extends GetxController {

  /// Loading indicator
  var isLoading = false.obs;

  /// All medicines
  var meds = <Med>[].obs;

  /// Sales used in the create form
  var sales = <Sale>[].obs;

  @override
  void onInit() {
    fetchMeds();
    super.onInit();
  }

  /// Fetch all medicines
  Future<void> fetchMeds() async {
    try {
      isLoading.value = true;

      /// Example API call
      /// final response = await api.getMeds();
      /// meds.value = response;

    } catch (e) {
      Get.snackbar("Error", "Failed to fetch medicines");
    } finally {
      isLoading.value = false;
    }
  }

  /// Create medicine
  Future<void> createMed(Med med) async {
    try {
      isLoading.value = true;

      /// Example API call
      /// final newMed = await api.createMed(med);

      meds.add(med);

      /// clear sales form
      sales.clear();

      Get.back();

      Get.snackbar("Success", "Medicine created successfully");

    } catch (e) {
      Get.snackbar("Error", "Failed to create medicine");
    } finally {
      isLoading.value = false;
    }
  }

  /// Delete medicine
  Future<void> deleteMed(int id) async {
    try {
      isLoading.value = true;

      /// API call
      /// await api.deleteMed(id);

      meds.removeWhere((med) => med.id == id);

      Get.snackbar("Deleted", "Medicine removed");

    } catch (e) {
      Get.snackbar("Error", "Failed to delete medicine");
    } finally {
      isLoading.value = false;
    }
  }

  /// Add sale row in form
  void addSale() {
    sales.add(
      Sale(
        quantity: 1,
        total: 0,
        medId: 0,
      ),
    );
  }

  /// Remove sale row
  void removeSale(int index) {
    sales.removeAt(index);
  }

}