import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nikahbay/constants/app_colors.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/controllers/registeration_controllers/forget_password_controller.dart';
import 'package:nikahbay/utils/app_navigation.dart';
import 'package:nikahbay/views/registeration/login.dart';
import 'package:nikahbay/widgets/app_button.dart';
import 'package:nikahbay/widgets/app_field.dart';
import 'package:nikahbay/widgets/app_text.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final ForgetPasswordController _controller =
      Get.put(ForgetPasswordController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          text: "Forget Password",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.defaultPadding,
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              SvgPicture.asset(
                "assets/icons/email_verify.svg",
              ),
              AppSpacing.heigthSpace30,
              AppField(
                controller: _controller.email,
                hintText: "Email",
                textType: TextInputType.emailAddress,
                prefixIcon: const Icon(
                  Icons.email_outlined,
                ),
              ),
              AppSpacing.heigthSpace30,
              GetBuilder<ForgetPasswordController>(
                init: ForgetPasswordController(),
                initState: (_) {},
                builder: (_) {
                  return AppButton(
                    isLoading: _.isLoading,
                    onTap: () async {
                      await _.sendOtp(context);
                    },
                    text: "RESET PASSWORD",
                  );
                },
              ),
              AppSpacing.heigthSpace30,
              TextButton(
                onPressed: () {
                  AppNavigation.offAll(
                    context,
                    nextPage: const Login(),
                  );
                },
                child: const AppText(
                  text: "Back to Login",
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                  textDecoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
