import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FilterController extends GetxController {
  int? selectedAgeFrom;
  int? selectedAgeTo;
  String? selectedHeightFrom;
  String? selectedHeightTo;

  String? maritalStatus;
  String? selectedReligion;
  String? selectedCountry;

  void changeSelectedCountry(String country) {
    selectedCountry = country;
    update();
  }

  void openCountryPicker(BuildContext context, FilterController controller) {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        controller.changeSelectedCountry(country.displayNameNoCountryCode);
      },
    );
  }

  List<int> ageFrom = List.generate(55, (index) => 16 + index);
  List<int> ageTo = List.generate(55, (index) => 16 + index);
  List<String> status = [
    "Single",
    "Married",
  ];
  List<String> heightFrom = [
    "4ft 1in",
    "4ft 2in",
    "4ft 3in",
    "4ft 4in",
    "4ft 5in",
    "4ft 6in",
    "4ft 7in",
    "4ft 8in",
    "4ft 9in",
    "4ft 10in",
    "4ft 11in",
    "5ft",
    "5ft 1in",
    "5ft 2in",
    "5ft 3in",
    "5ft 4in",
    "5ft 5in",
    "5ft 6in",
    "5ft 7in",
    "5ft 8in",
    "5ft 9in",
    "5ft 10in",
    "5ft 11in",
    "6ft",
    "6ft 1in",
    "6ft 2in",
    "6ft 3in",
    "6ft 4in",
    "6ft 5in",
    "6ft 6in",
    "6ft 7in",
    "6ft 8in",
    "6ft 9in",
    "6ft 10in",
    "7ft"
  ];

  List<String> heightTo = [
    "4ft 1in",
    "4ft 2in",
    "4ft 3in",
    "4ft 4in",
    "4ft 5in",
    "4ft 6in",
    "4ft 7in",
    "4ft 8in",
    "4ft 9in",
    "4ft 10in",
    "4ft 11in",
    "5ft",
    "5ft 1in",
    "5ft 2in",
    "5ft 3in",
    "5ft 4in",
    "5ft 5in",
    "5ft 6in",
    "5ft 7in",
    "5ft 8in",
    "5ft 9in",
    "5ft 10in",
    "5ft 11in",
    "6ft",
    "6ft 1in",
    "6ft 2in",
    "6ft 3in",
    "6ft 4in",
    "6ft 5in",
    "6ft 6in",
    "6ft 7in",
    "6ft 8in",
    "6ft 9in",
    "6ft 10in",
    "7ft"
  ];

  List<String> religion = [
    "Muslim",
    "Christian",
    "Hindu",
    "Sikh",
    "Other",
  ];
  void changeHeightFrom(String value) {
    selectedHeightFrom = value;
    update();
  }

  void changeHeightTo(String value) {
    selectedHeightTo = value;
    update();
  }

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
