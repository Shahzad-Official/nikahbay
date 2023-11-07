import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nikahbay/constants/app_colors.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/utils/app_navigation.dart';
import 'package:nikahbay/views/profile_view/settings/verification/camera_screen.dart.dart';
import 'package:nikahbay/widgets/app_button.dart';
import 'package:nikahbay/widgets/app_text.dart';

class VerifyAccount extends StatelessWidget {
  const VerifyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(text: "Verify Account"),
        leading: InkWell(
            onTap: () {
              AppNavigation.back(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Padding(
        padding: AppSpacing.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.heigthSpace10,
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.02),
              child: SvgPicture.asset(
                "assets/icons/verify_vector.svg",
                height: 280,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.790,
              ),
            ),
            AppSpacing.heigthSpace20,
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: "Verify Your Account to get Blue tick",
                  fontWeight: FontWeight.w600,
                  color: AppColors.secondaryColor,
                ),
              ],
            ),
            AppSpacing.heigthSpace20,
            const Row(
              children: [
                AppText(
                  text: "You can verify in 2 easy stps:",
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            AppSpacing.heigthSpace20,
            const AppText(
              text: "•  Take Picture and authenticate yourself.",
            ),
            AppSpacing.heigthSpace5,
            const AppText(text: "•  CNIC Verification."),
            const Spacer(),
            AppButton(
              text: "Continue to Proceed",
              onTap: () {
                AppNavigation.to(context, nextPage:  const CamerScreen());
              },
              height: 55,
            ),
            AppSpacing.heigthSpace30,
          ],
        ),
      ),
    );
  }
}
