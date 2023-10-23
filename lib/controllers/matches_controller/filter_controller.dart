import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FilterController extends GetxController {
  int? selectedAgeFrom;
  int? selectedAgeTo;
  String? maritalStatus;
  String? selectedReligion;

  List<int> ageFrom = List.generate(55, (index) => 16 + index);
  List<int> ageTo = List.generate(55, (index) => 16 + index);
  List<String> status = [
    "Single",
    "Married",
  ];
  List<String> religion = [
    "Muslim",
    "Christian",
    "Hindu",
    "Sikh",
    "Other",
  ];
  void changeAgeFrom(int value) {
    if (value >= 16 && value <= 70) {
      selectedAgeFrom = value;
    }
    update();
  }

  void changeAgeTo(int value) {
    if (value >= 16 && value <= 70) {
      selectedAgeTo = value;
    }
    update();
  }

  void changeStatus(String value) {
    maritalStatus = value;
    update();
  }

  void changeReligion(String value) {
    selectedReligion = value;
    update();
  }
}
