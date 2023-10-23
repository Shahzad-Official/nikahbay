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
      body: Padding(
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
                  DropdownContainer(
                      hintText: "Marital Status",
                      label: "Marital Status",
                      currentValue: controller.maritalStatus,
                      items: controller.status,
                      onValueChange: (Object? value) {
                        controller.changeStatus(value.toString());
                      }),
                  DropdownContainer(
                      hintText: "Country",
                      label: "Select  Country",
                      currentValue: controller.maritalStatus,
                      items: controller.status,
                      onValueChange: (Object? value) {
                        controller.changeStatus(value.toString());
                      }),
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
    );
  }
}
