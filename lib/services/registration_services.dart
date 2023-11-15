import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nikahbay/constants/api_constant.dart';
import 'package:nikahbay/main.dart';
import 'package:nikahbay/models/user_model.dart';
import 'package:nikahbay/utils/app_navigation.dart';
import 'package:nikahbay/utils/app_snackbar.dart';
import 'package:nikahbay/views/main_page/main_page.dart';
import 'package:nikahbay/views/registeration/otp_verification.dart';
import 'package:nikahbay/views/registeration/reset_password.dart';
import 'package:nikahbay/views/registeration/successfull_registration.dart';

class RegistrationServices {
  String get token => box.get("token");
  registerUser(
    context, {
    required String profile,
    required String firstName,
    required String lastName,
    required String userName,
    required String password,
    required String address,
    required String longitude,
    required String latitude,
    required String gender,
    required String email,
    required String mobile,
    required String mobileCode,
  }) async {
    var body = jsonEncode({
      "profile": profile,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "mobile": mobile,
      "mobileCode": mobileCode,
      "address": address,
      "latitude": latitude,
      "longitude": longitude,
      "gender": gender,
      "userName": userName,
    });

    try {
      var response = await post(
        Uri.parse(ApiConstant.baseUrl + ApiConstant.signUp),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      var data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        box.put("referralCode", null);
        box.put("token", data['token']);
        box.put("tempPass", password);

        AppNavigation.offAll(
          context,
          nextPage: OtpVerification(
            email: email,
          ),
        );
      } else {
        AppSnackbar.showSnackbar(title: "Error", message: data['message']);
      }
    } catch (err) {
      debugPrint(err.toString());
      AppSnackbar.showSnackbar(title: "Error", message: err.toString());
    }
  }

  login(
    context, {
    required String email,
    required String password,
    bool isAfterVerification = false,
  }) async {
    var body = jsonEncode({
      "email": email,
      "password": password,
    });
    await post(
      Uri.parse(ApiConstant.baseUrl + ApiConstant.login),
      headers: {
        "Content-Type": "application/json",
      },
      body: body,
    ).then((value) async {
      var data = jsonDecode(value.body);

      if (value.statusCode == 200) {
        box.put("token", data['token']);
        box.put("userData", value.body);

        box.put("isLoggedIn", true);
        if (!isAfterVerification) {
          AppSnackbar.showSnackbar(title: "Success", message: data['message']);
          AppNavigation.offAll(
            context,
            nextPage: const MainPage(),
          );
        }
      } else if (value.statusCode == 401) {
        await sendOtp(
          context,
          email: email,
          fromLogin: true,
        );
        AppSnackbar.showSnackbar(title: "Error", message: data['message']);
      } else {
        AppSnackbar.showSnackbar(title: "Error", message: data['message']);
      }
    }).catchError((err) {
      debugPrint(err.toString());
      AppSnackbar.showSnackbar(title: "Error", message: err.toString());
      // AppSnackbar.showSnackbar(title: "Error", message: "Something went wrong please try again later!");
    });
  }

  sendOtp(
    context, {
    required String email,
    bool fromLogin = false,
    bool isResend = false,
  }) async {
    var body = jsonEncode({
      "email": email,
    });
    await post(
      Uri.parse(ApiConstant.baseUrl + ApiConstant.sendOtp),
      headers: {
        "Content-Type": "application/json",
      },
      body: body,
    ).then((value) {
      var data = jsonDecode(value.body);

      if (value.statusCode == 200) {
        if (!fromLogin) {
          AppSnackbar.showSnackbar(title: "Success", message: data['message']);
          AppNavigation.offAll(
            context,
            nextPage: OtpVerification(
              email: email,
              isForgetEmail: fromLogin ? false : true,
            ),
          );
        } else if (isResend) {
          AppSnackbar.showSnackbar(
              title: "Success", message: "Otp has been resend to your email!");
        } else {
          AppNavigation.offAll(
            context,
            nextPage: OtpVerification(
              email: email,
              isForgetEmail: fromLogin ? false : true,
            ),
          );
        }
      } else {
        AppSnackbar.showSnackbar(title: "Error", message: data['message']);
      }
    }).catchError((err) {
      debugPrint(err.toString());
      AppSnackbar.showSnackbar(title: "Error", message: err.toString());
      // AppSnackbar.showSnackbar(title: "Error", message: "Something went wrong please try again later!");
    });
  }

  verifyOtp(
    context, {
    required String email,
    required bool isForgetEmail,
    required String otp,
  }) async {
    var body = jsonEncode({
      "otp": otp,
    });
    await post(
      Uri.parse(ApiConstant.baseUrl + ApiConstant.verifyOtp),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: body,
    ).then((value) {
      var data = jsonDecode(value.body);
      if (value.statusCode == 200) {
        AppSnackbar.showSnackbar(title: "Success", message: data['message']);
        if (isForgetEmail) {
          AppNavigation.offAll(
            context,
            nextPage: ResetPassword(
              email: email,
            ),
          );
        } else {
          login(
            context,
            email: email,
            password: box.get("tempPass").toString(),
            isAfterVerification: true,
          );
          AppNavigation.offAll(
            context,
            nextPage: const SuccessfullRegistration(
              isForgetPass: false,
            ),
          );
        }
      } else {
        debugPrint("otp error data=> $data");
        AppSnackbar.showSnackbar(title: "Error", message: data['message']);
      }
    }).catchError((err) {
      debugPrint(err.toString());
      AppSnackbar.showSnackbar(title: "Error", message: err.toString());
      // AppSnackbar.showSnackbar(title: "Error", message: "Something went wrong please try again later!");
    });
  }

  forgetPassword(
    context, {
    required String email,
    required String password,
  }) async {
    var body = jsonEncode({
      "email": email,
      "password": password,
    });
    await post(
      Uri.parse(ApiConstant.baseUrl + ApiConstant.forgetPassword),
      headers: {
        "Content-Type": "application/json",
      },
      body: body,
    ).then((value) {
      var data = jsonDecode(value.body);
      if (value.statusCode == 200) {
        AppSnackbar.showSnackbar(title: "Success", message: data['message']);
        AppNavigation.offAll(
          context,
          nextPage: const SuccessfullRegistration(
            isForgetPass: true,
          ),
        );
      } else {
        AppSnackbar.showSnackbar(title: "Error", message: data['message']);
      }
    }).catchError((err) {
      debugPrint(err.toString());
      AppSnackbar.showSnackbar(title: "Error", message: err.toString());
      // AppSnackbar.showSnackbar(title: "Error", message: "Something went wrong please try again later!");
    });
  }

  Future<UserData> getUserData(String userId) async {
    UserData userData = UserData();
    await get(
      Uri.parse(
          "${ApiConstant.baseUrl}${ApiConstant.getUserData}?userId=$userId"),
      headers: {
        "Content-Type": "application/json",
      },
    ).then((value) {
      var data = jsonDecode(value.body);
      if (value.statusCode == 200) {
        userData = UserData.fromJson(data['data']);
      }
    }).catchError((err) {
      AppSnackbar.showSnackbar(title: "Error", message: err.toString());
    });
    return userData;
  }
}
