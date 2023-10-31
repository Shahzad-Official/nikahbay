import 'package:flutter/material.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/views/matches/matches.dart';
import 'package:nikahbay/widgets/app_text.dart';

class PersonalInfo extends StatefulWidget {
  final MatchData match;

  const PersonalInfo({super.key, required this.match});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppSpacing.defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText(
                text: "Information",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              AppSpacing.heigthSpace10,
              const AppText(
                text: "A Few Lines About Me",
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontSize: 16,
              ),
              const AppText(
                  fontSize: 12,
                  color: Colors.grey,
                  text:
                      "Lorem ipsum, placeholder or dummy text used in typesetting and graphic design for previewing layouts. It features scrambled Latin text, which emphasizes the design over content of the layout. It is the standard placeholder text of the printing and publishing industries"),
              AppSpacing.heigthSpace20,
              const AppText(
                text: "Basic Details",
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
                      AppText(text: "Name"),
                      AppText(text: "Age"),
                      AppText(text: "Height"),
                      AppText(text: "Status"),
                      AppText(text: "Language"),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(text: widget.match.name),
                      const AppText(text: "20"),
                      const AppText(text: "4ft 2inc"),
                      const AppText(text: "Single"),
                      const AppText(text: "English"),
                    ],
                  ),
                ],
              ),
              AppSpacing.heigthSpace20,
              const AppText(
                text: "Habits",
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
                      AppText(text: "Eating"),
                      AppText(text: "Smoking"),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(text: "Vegeterian"),
                      AppText(text: "Non Smoking"),
                    ],
                  ),
                ],
              ),
              AppSpacing.heigthSpace20,
              const AppText(
                text: "Hobbies",
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontSize: 16,
              ),
              AppSpacing.heigthSpace10,
              const AppText(text: "Cooking"),
              AppSpacing.heigthSpace30,
            ],
          ),
        ),
      ],
    );
  }
}
