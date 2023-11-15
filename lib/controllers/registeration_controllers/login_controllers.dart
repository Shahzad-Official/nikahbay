
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikahbay/services/registration_services.dart';
import 'package:nikahbay/utils/app_snackbar.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
      await RegistrationServices()
          .login(context, email: email.text, password: password.text);
    }
    isLoading = false;
    update();
  }

  bool googleLoading = false;
  googleLogin(context) async {
    googleLoading = true;
    update();
    googleLoading = false;
    update();
  }
}
