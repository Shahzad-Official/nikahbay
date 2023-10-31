import 'package:flutter/material.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/widgets/app_text.dart';

class Preferences extends StatelessWidget {
  const Preferences({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.defaultPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText(
            text: "Preferences",
            fontWeight: FontWeight.w500,
            color: Colors.grey,
            fontSize: 18,
          ),
          AppSpacing.heigthSpace20,
          const AppText(
            text: "Partner Preferences",
            fontWeight: FontWeight.w500,
            color: Colors.grey,
            fontSize: 16,
          ),
          AppSpacing.heigthSpace10,
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.23,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(text: "Age"),
                    AppText(text: "Height"),
                    AppText(text: "Status"),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: "26-27 yrs"),
                  AppText(text: "5ft 4inc - 6ft 4inc"),
                  AppText(text: "Divorced, Separated")
                ],
              ),
            ],
          ),
          AppSpacing.heigthSpace30,
          const AppText(
            text: "Professional Preferences",
            fontWeight: FontWeight.w500,
            color: Colors.grey,
            fontSize: 16,
          ),
          AppSpacing.heigthSpace10,
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.23,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(text: "Education"),
                    AppText(text: "Ocuupation"),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: "BS"),
                  AppText(text: "Any"),
                ],
              ),
            ],
          ),
          AppSpacing.heigthSpace30,
          const AppText(
            text: "Location Preferences",
            fontWeight: FontWeight.w500,
            color: Colors.grey,
            fontSize: 16,
          ),
          AppSpacing.heigthSpace10,
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.23,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(text: "Cities"),
                    AppText(text: "Country"),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: "All"),
                  AppText(text: "Nepal"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
