import 'package:flutter/material.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/widgets/app_text.dart';

class ReligionInfo extends StatelessWidget {
  const ReligionInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.defaultPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpacing.heigthSpace20,
          const AppText(
            text: "Religion Information",
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
                  AppText(text: "Religion"),
                  AppText(text: "Cast"),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.12,
              ),
              const Column(
                children: [
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
                  AppText(text: "Islam"),
                  AppText(text: "Jatt"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
