import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_snackbar.dart';

class ResetPasswordController extends GetxController {
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  String email = "";
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
  resetPass(context) async {
    isLoading = true;
    update();
    if (password.text.isEmpty || password.text.length < 6) {
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
