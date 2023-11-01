import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:nikahbay/constants/app_colors.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/controllers/profile_view_controller/subscription_controller.dart';
import 'package:nikahbay/utils/app_navigation.dart';
import 'package:nikahbay/widgets/app_button.dart';
import 'package:nikahbay/widgets/app_shadowcontainer.dart';
import 'package:nikahbay/widgets/app_text.dart';

class SubscriptionPlan extends StatelessWidget {
  const SubscriptionPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(text: "Subscriptions Plan"),
        leading: InkWell(
            onTap: () {
              AppNavigation.back(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacing.defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.heigthSpace20,
              const AppText(
                text: "Select your plan",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
              AppSpacing.heigthSpace20,
              GetBuilder<SubscriptionPlanController>(
                  init: SubscriptionPlanController(),
                  initState: (state) {},
                  builder: (controller) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.changeIndex(0);
                          },
                          child: AppShadowcontainer(
                            color: controller.selectedIndex == 0
                                ? AppColors.primaryColor
                                : Colors.white,
                            shape: BoxShape.rectangle,
                            height: 160,
                            width: double.infinity,
                            child: Padding(
                              padding: AppSpacing.defaultPadding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText(
                                        text: "Premium Plan",
                                        color: controller.selectedIndex == 0
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      AppText(
                                        text: "\$39.19",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: controller.selectedIndex == 0
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ],
                                  ),
                                  AppSpacing.heigthSpace10,
                                  Row(
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: controller.selectedIndex == 0
                                              ? Colors.white.withOpacity(0.9)
                                              : Colors.brown.withOpacity(0.07),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      AppText(
                                        text: "Direct message to all proile",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: controller.selectedIndex == 0
                                            ? Colors.white.withOpacity(0.9)
                                            : Colors.grey,
                                      )
                                    ],
                                  ),
                                  AppSpacing.heigthSpace5,
                                  Row(
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: controller.selectedIndex == 0
                                              ? Colors.white.withOpacity(0.9)
                                              : Colors.brown.withOpacity(0.07),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      AppText(
                                        text: "Unlimited profile views",
                                        fontSize: 12,
                                        color: controller.selectedIndex == 0
                                            ? Colors.white.withOpacity(0.9)
                                            : Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      )
                                    ],
                                  ),
                                  AppSpacing.heigthSpace5,
                                  Row(
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: controller.selectedIndex == 0
                                              ? Colors.white.withOpacity(0.9)
                                              : Colors.brown.withOpacity(0.07),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      AppText(
                                        text: "Access for 30 days",
                                        fontSize: 12,
                                        color: controller.selectedIndex == 0
                                            ? Colors.white.withOpacity(0.9)
                                            : Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        AppSpacing.heigthSpace30,
                        GestureDetector(
                          onTap: () {
                            controller.changeIndex(1);
                          },
                          child: AppShadowcontainer(
                            color: controller.selectedIndex == 1
                                ? AppColors.primaryColor
                                : Colors.white,
                            shape: BoxShape.rectangle,
                            height: 160,
                            width: double.infinity,
                            child: Padding(
                              padding: AppSpacing.defaultPadding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText(
                                        text: "Basic Plan",
                                        color: controller.selectedIndex == 1
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      AppText(
                                        text: "\$9.19",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: controller.selectedIndex == 1
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ],
                                  ),
                                  AppSpacing.heigthSpace10,
                                  Row(
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: controller.selectedIndex == 1
                                              ? Colors.white.withOpacity(0.9)
                                              : Colors.brown.withOpacity(0.07),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      AppText(
                                        text: "No direct message",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: controller.selectedIndex == 1
                                            ? Colors.white.withOpacity(0.9)
                                            : Colors.grey,
                                      )
                                    ],
                                  ),
                                  AppSpacing.heigthSpace5,
                                  Row(
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: controller.selectedIndex == 1
                                              ? Colors.white.withOpacity(0.9)
                                              : Colors.brown.withOpacity(0.07),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      AppText(
                                        text: "50 profile visits everyday",
                                        fontSize: 12,
                                        color: controller.selectedIndex == 1
                                            ? Colors.white.withOpacity(0.9)
                                            : Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      )
                                    ],
                                  ),
                                  AppSpacing.heigthSpace5,
                                  Row(
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: controller.selectedIndex == 1
                                              ? Colors.white.withOpacity(0.9)
                                              : Colors.brown.withOpacity(0.07),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      AppText(
                                        text: "Access for 10 days",
                                        fontSize: 12,
                                        color: controller.selectedIndex == 1
                                            ? Colors.white.withOpacity(0.9)
                                            : Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        AppSpacing.heigthSpace30,
                        GestureDetector(
                          onTap: () {
                            controller.changeIndex(2);
                          },
                          child: AppShadowcontainer(
                            shape: BoxShape.rectangle,
                            color: controller.selectedIndex == 2
                                ? AppColors.primaryColor
                                : Colors.white,
                            height: 160,
                            width: double.infinity,
                            child: Padding(
                              padding: AppSpacing.defaultPadding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText(
                                        text: "Economy Plan",
                                        color: controller.selectedIndex == 2
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      AppText(
                                        text: "\$24.19",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: controller.selectedIndex == 2
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ],
                                  ),
                                  AppSpacing.heigthSpace10,
                                  Row(
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: controller.selectedIndex == 2
                                              ? Colors.white.withOpacity(0.9)
                                              : Colors.brown.withOpacity(0.07),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      AppText(
                                        text:
                                            "Direct message to 3 profile everyday",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: controller.selectedIndex == 2
                                            ? Colors.white.withOpacity(0.9)
                                            : Colors.grey,
                                      )
                                    ],
                                  ),
                                  AppSpacing.heigthSpace5,
                                  Row(
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: controller.selectedIndex == 2
                                              ? Colors.white.withOpacity(0.9)
                                              : Colors.brown.withOpacity(0.07),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      AppText(
                                        text: "250 profile visits everyday",
                                        fontSize: 12,
                                        color: controller.selectedIndex == 2
                                            ? Colors.white.withOpacity(0.9)
                                            : Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      )
                                    ],
                                  ),
                                  AppSpacing.heigthSpace5,
                                  Row(
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: controller.selectedIndex == 2
                                              ? Colors.white.withOpacity(0.9)
                                              : Colors.brown.withOpacity(0.07),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      AppText(
                                        text: "Access for 28 days",
                                        fontSize: 12,
                                        color: controller.selectedIndex == 2
                                            ? Colors.white.withOpacity(0.9)
                                            : Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
              AppSpacing.heigthSpace30,
              AppButton(
                text: "Contiue",
                onTap: () {},
              ),
              AppSpacing.heigthSpace30,
            ],
          ),
        ),
      ),
    );
  }
}
