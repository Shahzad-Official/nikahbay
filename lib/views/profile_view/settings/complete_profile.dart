import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/controllers/profile_view_controller/complete_profile_controller.dart';
import 'package:nikahbay/utils/app_navigation.dart';
import 'package:nikahbay/widgets/app_button.dart';
import 'package:nikahbay/widgets/app_field.dart';
import 'package:nikahbay/widgets/app_text.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(text: "Complete Profile"),
        leading: InkWell(
            onTap: () {
              AppNavigation.back(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacing.defaultPadding,
          child: GetBuilder<CompleteProfileController>(
              init: CompleteProfileController(),
              initState: (state) {},
              builder: (controller) {
                return Column(
                  children: [
                    AppSpacing.heigthSpace20,
                    Row(
                      children: [
                        Expanded(
                          child: AppField(
                            labelText: "Height(ft)",
                            textType: TextInputType.number,
                            onTap: () {},
                            controller: controller.ftheightController,
                          ),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Expanded(
                          child: AppField(
                            labelText: "Height(inches)",
                            textType: TextInputType.number,
                            onTap: () {},
                            controller: controller.inheightController,
                          ),
                        ),
                      ],
                    ),
                    AppSpacing.heigthSpace30,
                    AppField(
                      labelText: "Your Weight",
                      textType: TextInputType.number,
                      onTap: () {},
                      controller: controller.weightController,
                    ),
                    AppSpacing.heigthSpace30,
                    AppField(
                      labelText: "Your Profession",
                      onTap: () {},
                      controller: controller.professionController,
                    ),
                    AppSpacing.heigthSpace30,
                    AppField(
                      labelText: "Your Education",
                      onTap: () {},
                      controller: controller.educationController,
                    ),
                    AppSpacing.heigthSpace30,
                    AppField(
                      labelText: "Your Religion",
                      onTap: () {},
                      controller: controller.religionController,
                    ),
                    AppSpacing.heigthSpace30,
                    AppField(
                      labelText: "Your Age",
                      onTap: () {},
                      controller: controller.ageController,
                      textType: TextInputType.number,
                    ),
                    AppSpacing.heigthSpace30,
                    AppField(
                      labelText: "Marital Status",
                      controller: controller.statusController,
                      onTap: () {},
                    ),
                    AppSpacing.heigthSpace30,
                    AppField(
                      controller: controller.dateController,
                      labelText: "Date of Birth",
                      readOnly: true,
                      onTap: () {
                        controller.selectDate(context);
                      },
                    ),
                    AppSpacing.heigthSpace30,
                    AppField(
                      controller: controller.languageController,
                      labelText: "Languages",
                    ),
                    AppSpacing.heigthSpace30,
                    AppField(
                      labelText: "Your Bio",
                      controller: controller.bioController,
                      onTap: () {},
                      maxLines: 4,
                    ),
                    AppSpacing.heigthSpace30,
                    AppButton(
                      text: "Complete Profile",
                      onTap: () {},
                    ),
                    AppSpacing.heigthSpace30,
                  ],
                );
              }),
        ),
      ),
    );
  }
}
