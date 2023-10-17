import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_snackbar.dart';

class SignupController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  TextEditingController refCode = TextEditingController();

  String countryCode = "";

  String groupValue = "Male";
  changeGender(String value) {
    groupValue = value;
    update();
  }

  bool isObsecure = true;
  changeObsecurity() {
    isObsecure = !isObsecure;
    update();
  }

  bool isObsecure1 = true;
  changeObsecurity1() {
    isObsecure1 = !isObsecure1;
    update();
  }

  bool isLoading = false;

  File? profile;
  String base64Image = "";

  registerUser(context) async {
    isLoading = true;
    update();
    if (profile == null) {
      AppSnackbar.showSnackbar(
          title: "Error", message: "Please select your profile picture!");
    } else if (email.text.isEmpty || !email.text.isEmail) {
      AppSnackbar.showSnackbar(
          title: "Error", message: "Please enter valid email address!");
    } else if (number.text.isEmpty) {
      AppSnackbar.showSnackbar(
          title: "Error", message: "Please enter your phone number!");
    } else if (location.text.isEmpty) {
      AppSnackbar.showSnackbar(
          title: "Error", message: "Please select your location!");
    } else if (password.text.isEmpty || password.text.length < 6) {
      AppSnackbar.showSnackbar(
          title: "Error",
          message: "Please enter password having at least 6 characters!");
    } else if (password.text != cpassword.text) {
      AppSnackbar.showSnackbar(
          title: "Error", message: "Please check your confirm password!");
    } else {}
    isLoading = false;
    update();
  }
}
