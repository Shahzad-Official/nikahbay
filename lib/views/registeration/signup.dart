import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nikahbay/constants/app_colors.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/controllers/registeration_controllers/signup_controllers.dart';
import 'package:nikahbay/utils/app_navigation.dart';
import 'package:nikahbay/views/registeration/login.dart';
import 'package:nikahbay/widgets/app_button.dart';
import 'package:nikahbay/widgets/app_field.dart';

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
              AppSpacing.heigthSpace30,
              AppField(
                controller: _controller.firstName,
                hintText: "Full Name",
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
