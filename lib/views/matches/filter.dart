import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/utils/app_navigation.dart';
import 'package:nikahbay/widgets/app_button.dart';
import 'package:nikahbay/widgets/app_field.dart';
import 'package:nikahbay/widgets/app_text.dart';
import '../../controllers/matches_controller/filter_controller.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              AppNavigation.back(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const AppText(text: "Filter"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacing.defaultPadding,
          child: GetBuilder<FilterController>(
              init: FilterController(),
              initState: (state) {},
              builder: (controller) {
                return Column(
                  children: [
                    const Row(
                      children: [
                        AppText(
                          text: "Age",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownContainer(
                            label: "From",
                            currentValue:
                                controller.selectedAgeFrom?.toString() ?? '16',
                            items: controller.ageFrom
                                .map((age) => age.toString())
                                .toList(),
                            onValueChange: (Object? value) {
                              if (value != null) {
                                controller
                                    .changeAgeFrom(int.parse(value.toString()));
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: DropdownContainer(
                            label: "To",
                            currentValue:
                                controller.selectedAgeTo?.toString() ?? '16',
                            items: controller.ageTo
                                .map((age) => age.toString())
                                .toList(),
                            onValueChange: (Object? value) {
                              if (value != null) {
                                controller
                                    .changeAgeTo(int.parse(value.toString()));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    AppSpacing.heigthSpace20,
                    const Row(
                      children: [
                        AppText(
                          text: "Height",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownContainer(
                            label: "From",
                            currentValue:
                                controller.selectedHeightFrom ?? '4ft 1in',
                            items: controller.heightFrom,
                            onValueChange: (Object? value) {
                              if (value != null) {
                                controller.changeHeightFrom(value.toString());
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: DropdownContainer(
                            label: "To",
                            currentValue:
                                controller.selectedHeightTo ?? '4ft 1in',
                            items: controller.heightTo,
                            onValueChange: (Object? value) {
                              if (value != null) {
                                controller.changeHeightTo(value.toString());
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    DropdownContainer(
                        hintText: "Marital Status",
                        label: "Marital Status",
                        currentValue: controller.maritalStatus,
                        items: controller.status,
                        onValueChange: (Object? value) {
                          controller.changeStatus(value.toString());
                        }),
                    AppSpacing.heigthSpace10,
                    AppSpacing.heigthSpace5,
                    const Row(
                      children: [
                        AppText(
                          text: "Select your Country",
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ],
                    ),
                    AppSpacing.heigthSpace20,
                    InkWell(
                      onTap: () {
                        controller.openCountryPicker(context, controller);
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 226, 227, 231)
                                  .withOpacity(0.2),
                              blurRadius: 6,
                              spreadRadius: 2,
                              offset: const Offset(0, 8),
                            ),
                            BoxShadow(
                              color: const Color.fromARGB(255, 226, 227, 231)
                                  .withOpacity(0.4),
                              blurRadius: 14,
                              spreadRadius: 4,
                              offset: const Offset(0, 7),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.085),
                                child: AppText(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff7B7A7A),
                                    text: controller.selectedCountry ??
                                        "Select aCountry"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width *
                                        0.05),
                                child: const Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    DropdownContainer(
                        hintText: "Religion",
                        label: "Select your religion",
                        currentValue: controller.selectedReligion,
                        items: controller.religion,
                        onValueChange: (Object? value) {
                          controller.changeReligion(value.toString());
                        }),
                    AppSpacing.heigthSpace30,
                    AppButton(
                      text: "Apply",
                      onTap: () {},
                      height: 60,
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
