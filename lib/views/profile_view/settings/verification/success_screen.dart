import 'package:flutter/material.dart';
import 'package:nikahbay/constants/app_colors.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/utils/app_navigation.dart';
import 'package:nikahbay/views/main_page/main_page.dart';
import 'package:nikahbay/widgets/app_button.dart';
import 'package:nikahbay/widgets/app_text.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              AppNavigation.offAll(context, nextPage: const MainPage());
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: AppSpacing.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            Image.asset(
              "assets/images/success.png",
              width: MediaQuery.of(context).size.width * 0.45,
            ),
            AppSpacing.heigthSpace30,
            AppSpacing.heigthSpace20,
            const AppText(
              text: "Thank You!",
              color: AppColors.secondaryColor,
              fontSize: 35,
            ),
            AppSpacing.heigthSpace10,
            const AppText(
              text: "Request Submitted Successfully",
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            AppSpacing.heigthSpace20,
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.80,
              child: const AppText(
                text:
                    "Thank you for reaching out! Your message is valuable to us. Our team is dedicated to providing you with a prompt response, typically within two to three business days.",
                fontStyle: FontStyle.italic,
                textAlign: TextAlign.justify,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  text: "Go to HomePage",
                  width: MediaQuery.of(context).size.width * 0.80,
                  onTap: () {
                    AppNavigation.to(context, nextPage: const MainPage());
                  },
                  height: 50,
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
