import 'package:flutter/material.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/widgets/app_text.dart';

class ProfessionalInfo extends StatelessWidget {
  const ProfessionalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.defaultPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpacing.heigthSpace20,
          const AppText(
            text: "Professional Information",
            fontWeight: FontWeight.w500,
            color: Colors.grey,
            fontSize: 16,
          ),
          AppSpacing.heigthSpace10,
          Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: "Education"),
                  AppText(text: "Annual Income"),
                  AppText(text: "Occupation"),
                  AppText(text: "Employed In"),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.12,
              ),
              const Column(
                children: [
                  AppText(text: "-"),
                  AppText(text: "-"),
                  AppText(text: "-"),
                  AppText(text: "-"),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.12,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: "MCS"),
                  AppText(text: "Not Specified"),
                  AppText(text: "Software Engineer"),
                  AppText(text: "ABC Company"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
