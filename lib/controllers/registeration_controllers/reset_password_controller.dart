import 'package:flutter/material.dart';
import 'package:get/get.dart';


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
 


}
