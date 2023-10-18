import 'package:flutter/material.dart';
import 'package:nikahbay/constants/app_colors.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/utils/app_navigation.dart';
import 'package:nikahbay/views/main_page/main_page.dart';
import 'package:nikahbay/widgets/app_button.dart';
import 'package:nikahbay/widgets/app_text.dart';

class SuccessfullRegistration extends StatelessWidget {
  final bool isForgetPass;
  const SuccessfullRegistration({Key? key, required this.isForgetPass})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppSpacing.defaultPadding,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // LottieBuilder.asset(
              //   isForgetPass
              //       ? "assets/password_reset.json"
              //       : "assets/success.json",
              //   reverse: false,
              // ),
              AppSpacing.heigthSpace30,
              AppText(
                text: isForgetPass
                    ? "Password Reset Successfull"
                    : "Registration Successful",
                fontSize: 20,
                color: AppColors.primaryColor,
              ),
              AppSpacing.heigthSpace10,
              const AppText(
                text:
                    "Congratulations, your password has been reset Successfully. You can login to the app now!",
                textAlign: TextAlign.center,
                fontSize: 17,
                fontWeight: FontWeight.w300,
              ),
              AppSpacing.heigthSpace30,
              AppButton(
                onTap: () {
                  AppNavigation.offAll(
                    context,
                    nextPage: const MainPage(),
                  );
                },
                text: "Go To HomePage",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
