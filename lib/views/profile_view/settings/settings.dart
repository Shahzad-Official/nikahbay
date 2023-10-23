import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/controllers/profile_view_controller/settings_controller.dart';
import 'package:nikahbay/utils/app_navigation.dart';
import 'package:nikahbay/views/profile_view/settings/about_us.dart';
import 'package:nikahbay/views/profile_view/settings/edit_profile.dart';
import 'package:nikahbay/views/profile_view/profile_view.dart';
import 'package:nikahbay/views/profile_view/settings/privacy_poicy.dart';
import 'package:nikahbay/widgets/app_text.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(text: "Settings"),
        leading: InkWell(
            onTap: () {
              AppNavigation.back(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Padding(
        padding: AppSpacing.defaultPadding,
        child: GetBuilder<SettingsController>(
            init: SettingsController(),
            builder: (controller) {
              return Column(
                children: [
                  ProfileWidget(
                    title: "Edit Profile",
                    icon: 'assets/icons/edit.svg',
                    onTap: () {
                      AppNavigation.to(context, nextPage: const EditProfile());
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Divider(
                      thickness: 1,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  ProfileWidget(
                    title: "Privacy Policy",
                    icon: 'assets/icons/privacy.svg',
                    onTap: () {
                      AppNavigation.to(context,
                          nextPage: const PrivacyPolicy());
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Divider(
                      thickness: 1,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  ProfileWidget(
                    title: "About Us",
                    icon: 'assets/icons/about.svg',
                    onTap: () {
                      AppNavigation.to(context, nextPage: const AboutUs());
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Divider(
                      thickness: 1,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/lightbulb.svg',
                            height: 30,
                            width: MediaQuery.of(context).size.width * 0.08,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const AppText(
                            text: "Dark Mode",
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 100,
                        child: Switch(
                          value: controller.isSwitched.value,
                          onChanged: (value) {
                            controller.changeSwitch(value);
                            Get.changeThemeMode(controller.isSwitched.value
                                ? ThemeMode.dark
                                : ThemeMode.light);
                          },
                        ),
                      ),
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }
}
