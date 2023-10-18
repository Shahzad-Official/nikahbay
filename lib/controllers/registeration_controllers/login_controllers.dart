import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikahbay/utils/app_navigation.dart';
import 'package:nikahbay/views/registeration/otp_verification.dart';

import '../../utils/app_snackbar.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController number = TextEditingController();

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

  bool isLoading = false;
  login(context) async {
    isLoading = true;
    update();
    if (email.text.isEmpty || !email.text.isEmail) {
      AppSnackbar.showSnackbar(
          title: "Error", message: "Please enter valid email!");
    } else if (password.text.isEmpty || password.text.length < 6) {
      AppSnackbar.showSnackbar(
          title: "Error", message: "Please enter valid password!");
    } else {
      AppNavigation.offAll(context,
          nextPage: const OtpVerification(email: "email"));
    }
    isLoading = false;
    update();
  }

  bool googleLoading = false;
}
