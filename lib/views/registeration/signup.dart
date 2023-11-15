import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nikahbay/constants/app_colors.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/controllers/registeration_controllers/signup_controllers.dart';
import 'package:nikahbay/utils/app_navigation.dart';
import 'package:nikahbay/views/registeration/login.dart';
import 'package:nikahbay/widgets/app_button.dart';
import 'package:nikahbay/widgets/app_field.dart';
import 'package:nikahbay/widgets/app_shadowcontainer.dart';
import 'package:nikahbay/widgets/app_text.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final SignupController _controller = Get.put(SignupController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.defaultPadding,
          child: ListView(
            shrinkWrap: true,
            children: [
              AppSpacing.heigthSpace30,
              AppSpacing.heigthSpace20,
              Center(
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      GetBuilder<SignupController>(
                        init: SignupController(),
                        initState: (_) {},
                        builder: (_) {
                          return AppShadowcontainer(
                            height: 150,
                            width: 150,
                            image: _.profile == null
                                ? const AssetImage(
                                    "assets/images/placeholder.png",
                                  )
                                : FileImage(_.profile!) as ImageProvider,
                            child: const SizedBox(),
                          );
                        },
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                              (states) => AppColors.primaryColor,
                            ),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.white,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          AppNavigation.back(context);
                                          _controller.pickProfile(
                                              source: ImageSource.camera);
                                        },
                                        child: const SizedBox(
                                          height: 120,
                                          child: Column(
                                            children: [
                                              AppShadowcontainer(
                                                child: Icon(
                                                  Icons.camera_alt_outlined,
                                                ),
                                              ),
                                              AppSpacing.heigthSpace10,
                                              AppText(
                                                text: "Camera",
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              AppSpacing.heigthSpace10,
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          AppNavigation.back(context);
                                          _controller.pickProfile(
                                              source: ImageSource.gallery);
                                        },
                                        child: const SizedBox(
                                          height: 120,
                                          child: Column(
                                            children: [
                                              AppShadowcontainer(
                                                child: Icon(
                                                  Icons.photo_outlined,
                                                ),
                                              ),
                                              AppSpacing.heigthSpace10,
                                              AppText(
                                                text: "Gallery",
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              AppSpacing.heigthSpace10,
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.camera,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppSpacing.heigthSpace30,
              Row(
                children: [
                  Expanded(
                    child: AppField(
                      controller: _controller.firstName,
                      hintText: "First Name",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: AppField(
                      controller: _controller.lastName,
                      hintText: "Last Name",
                    ),
                  ),
                ],
              ),
              AppSpacing.heigthSpace20,
              AppField(
                controller: _controller.userName,
                hintText: "Username",
                prefixIcon: const Icon(
                  Icons.person,
                  color: AppColors.primaryColor,
                ),
              ),
              AppSpacing.heigthSpace20,
              AppField(
                controller: _controller.email,
                hintText: "Email",
                textType: TextInputType.emailAddress,
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: AppColors.primaryColor,
                ),
              ),
              AppSpacing.heigthSpace20,
              AppPhoneField(
                hintText: "Mobile Number",
                controller: _controller.number,
                onChanged: (number) {
                  _controller.countryCode = number.countryCode;
                },
              ),
              AppSpacing.heigthSpace20,
              const AppText(
                text: "Select Gender:",
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
              GetBuilder<SignupController>(
                init: SignupController(),
                initState: (_) {},
                builder: (_) {
                  return RadioListTile(
                    value: "Male",
                    groupValue: _.groupValue,
                    onChanged: (value) {
                      _.changeGender(value.toString());
                    },
                    title: const AppText(
                      text: "Male",
                    ),
                  );
                },
              ),
              GetBuilder<SignupController>(
                init: SignupController(),
                initState: (_) {},
                builder: (_) {
                  return RadioListTile(
                    value: "Female",
                    groupValue: _.groupValue,
                    onChanged: (value) {
                      _.changeGender(value.toString());
                    },
                    title: const AppText(
                      text: "Female",
                    ),
                  );
                },
              ),
              GetBuilder<SignupController>(
                init: SignupController(),
                initState: (_) {},
                builder: (_) {
                  return RadioListTile(
                    value: "Other",
                    groupValue: _.groupValue,
                    onChanged: (value) {
                      _.changeGender(value.toString());
                    },
                    title: const AppText(
                      text: "Other",
                    ),
                  );
                },
              ),
              AppSpacing.heigthSpace20,
              AppField(
                readOnly: true,
                controller: _controller.location,
                onTap: () async {
                  await _controller.pickLocation(context);
                },
                suffixIcon: const Icon(
                  Icons.location_on_outlined,
                ),
              ),
              AppSpacing.heigthSpace20,
              GetBuilder<SignupController>(
                init: SignupController(),
                initState: (_) {},
                builder: (_) {
                  return AppField(
                    controller: _controller.password,
                    isObsecure: _.isObsecure,
                    textType: TextInputType.visiblePassword,
                    hintText: "Password",
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: AppColors.primaryColor,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _.changeObsecurity();
                      },
                      icon: Icon(
                        _.isObsecure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                  );
                },
              ),
              AppSpacing.heigthSpace30,
              GetBuilder<SignupController>(
                init: SignupController(),
                initState: (_) {},
                builder: (_) {
                  return AppField(
                    controller: _controller.cpassword,
                    isObsecure: _.isObsecure1,
                    textType: TextInputType.visiblePassword,
                    hintText: "Confirm Password",
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: AppColors.primaryColor,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _.changeObsecurity1();
                      },
                      icon: Icon(
                        _.isObsecure1
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                  );
                },
              ),
              AppSpacing.heigthSpace30,
              GetBuilder<SignupController>(
                init: SignupController(),
                initState: (_) {},
                builder: (_) {
                  return AppButton(
                    isLoading: _.isLoading,
                    onTap: () async {
                      await _.registerUser(context);
                    },
                    text: "SIGNUP",
                  );
                },
              ),
              AppSpacing.heigthSpace30,
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an account? ",
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: "LogIn",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            AppNavigation.offAll(
                              context,
                              nextPage: const Login(),
                            );
                          },
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
