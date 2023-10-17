import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikahbay/utils/app_snackbar.dart';

class ForgetPasswordController extends GetxController {
  TextEditingController email = TextEditingController();
  bool isLoading = false;
  sendOtp(context) async {
    isLoading = true;
    update();
    if (!email.text.isEmail) {
      AppSnackbar.showSnackbar(
          title: "Error", message: "Please enter valid email!");
    } else {}
    isLoading = false;
    update();
  }
}
