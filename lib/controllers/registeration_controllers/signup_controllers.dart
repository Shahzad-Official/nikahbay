import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nikahbay/services/location_services.dart';
import 'package:nikahbay/services/registration_services.dart';
import 'package:nikahbay/utils/app_image_utils.dart';
import 'package:nikahbay/utils/app_navigation.dart';

import '../../utils/app_snackbar.dart';

class SignupController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();

  String countryCode = "";
  String latitude = "";
  String longitude = "";
  String groupValue = "Male";
  final RegistrationServices _registrationServices = RegistrationServices();

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
  pickProfile({required ImageSource source}) async {
    // ignore: invalid_use_of_visible_for_testing_member
    await ImagePicker.platform
        .getImageFromSource(source: source)
        .then((value) async {
      if (value != null) {
        var newprofile = File(value.path);
        var fileSize = await AppImageUtils.fileSize(newprofile);
        if (fileSize > 2) {
          var file = await AppImageUtils.compressImage(
            file: newprofile,
            quality: fileSize > 5 && fileSize <= 10
                ? 20
                : fileSize > 10
                    ? 30
                    : 50,
          );

          profile = file;
        } else {
          profile = newprofile;
        }
        base64Image = base64Encode(profile!.readAsBytesSync());

        update();
      } else {}
    }).catchError((err) {
      if (err is PathAccessException) {
      } else if (err is FileSystemException) {}
    });
  }

  pickLocation(context) async {
    location.text = "loading....";
    var isenable = await LocationServices().determinePosition();
    if (!isenable) {
      Get.defaultDialog(
        title: "Please enable location permissions",
        content: const SizedBox(),
        onConfirm: () async {
          await Geolocator.openLocationSettings().then((value) async {
            location.text = "Tap again";
            Get.back();
          });
        },
        onCancel: () {
          Get.back();
        },
      );
    } else {
      await AppNavigation.to(
        context,
        nextPage: PlacePicker(
          apiKey: "AIzaSyDq33g2UnBUqsMbCPvHT8imFd20IsLuel0",
          initialPosition: const LatLng(30.1811532, 71.3098456),
          enableMyLocationButton: true,
          useCurrentLocation: true,
          onPlacePicked: (value) async {
            latitude = value.geometry!.location.lat.toString();
            longitude = value.geometry!.location.lng.toString();
            AppNavigation.back(context);
            location.text = await LocationServices.translateAddress(
                latitude: value.geometry!.location.lat,
                longitude: value.geometry!.location.lng);
          },
        ),
      );
    }
    location.text = "Tap again";
  }

  registerUser(context) async {
    isLoading = true;
    update();
    if (profile == null) {
      AppSnackbar.showSnackbar(
          title: "Error", message: "Please select your profile picture!");
    } else if (firstName.text.isEmpty) {
      AppSnackbar.showSnackbar(
          title: "Error", message: "Please enter your first name");
    } else if (lastName.text.isEmpty) {
      AppSnackbar.showSnackbar(
          title: "Error", message: "Please enter your last name");
    } else if (userName.text.isEmpty) {
      AppSnackbar.showSnackbar(
          title: "Error", message: "Please enter your user name");
    } else if (email.text.isEmpty) {
      AppSnackbar.showSnackbar(
          title: "Error", message: "Please enter your email address");
    } else if (email.text.isEmpty || !email.text.isEmail) {
      AppSnackbar.showSnackbar(
          title: "Error", message: "Please enter valid email address!");
    } else if (number.text.isEmpty) {
      AppSnackbar.showSnackbar(
          title: "Error", message: "Please enter your phone number!");
    } else if (password.text.isEmpty || password.text.length < 6) {
      AppSnackbar.showSnackbar(
          title: "Error",
          message: "Please enter password having at least 6 characters!");
    } else if (password.text != cpassword.text) {
      AppSnackbar.showSnackbar(
          title: "Error", message: "Please check your confirm password!");
    } else {
      await _registrationServices.registerUser(
        context,
        mobileCode: countryCode,
        firstName: firstName.text,
        lastName: lastName.text,
        password: password.text,
        email: email.text,
        mobile: number.text,
        profile: base64Image,
        address: location.text,
        latitude: latitude,
        longitude: longitude,
        gender: groupValue,
        userName: userName.text,
      );
    }
   

    isLoading = false;
    update();
  }
}
