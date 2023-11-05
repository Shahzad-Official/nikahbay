import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CompleteProfileController extends GetxController {
  TextEditingController dateController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController ftheightController = TextEditingController();
  TextEditingController inheightController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dateController.text = "${picked.toLocal()}".split(' ')[0];
    }
  }
}
