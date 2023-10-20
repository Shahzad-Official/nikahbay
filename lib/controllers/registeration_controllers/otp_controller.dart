import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nikahbay/utils/app_navigation.dart';
import 'package:nikahbay/utils/app_snackbar.dart';
import 'package:nikahbay/views/registeration/successfull_registration.dart';

class OtpController extends GetxController {
  TextEditingController otp = TextEditingController();
  String email = "";
  bool isOtpExpires = false;
  DateTime currentTime = DateTime(
    2023,
    0,
    0,
    0,
    1,
    0,
  );
  Timer? timer;
  String? otpTime;
  bool isResending = false;
  resendOtp(context) async {
    isResending = true;
    update();

    isResending = false;
    update();
  }

  startTimer() {
    isOtpExpires = false;
    currentTime = DateTime(
      2023,
      0,
      0,
      0,
      1,
      0,
    );
    otpTime = DateFormat().add_ms().format(currentTime);
    update();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      DateTime newTime = currentTime.subtract(
        Duration(seconds: timer.tick),
      );

      otpTime = DateFormat().add_ms().format(newTime);

      update();
      if (newTime.second <= 0) {
        timer.cancel();
        isOtpExpires = true;
        update();
      }
    });
  }

  disposeTimer() {
    timer?.cancel();
  }

  bool isLoading = false;
  verifyOtp(context, {required bool isForgetEmail}) async {
    if (otp.text.isEmpty || otp.text.length < 5) {
      AppSnackbar.showSnackbar(title: "Error", message: "Please enter valid otp!");
    } else {
      isLoading = true;
      update();
      AppNavigation.offAll(
        context,
        nextPage: SuccessfullRegistration(
          isForgetPass: isForgetEmail,
        ),
      );

      isLoading = false;
      update();
    }
  }
}
