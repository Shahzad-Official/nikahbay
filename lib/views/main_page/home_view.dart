import 'package:flutter/material.dart';
import 'package:nikahbay/constants/app_colors.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/widgets/app_button.dart';
import 'package:nikahbay/widgets/app_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppSpacing.defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: "Home",
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              AppSpacing.heigthSpace30,
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.24,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: "Azhar Khan",
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                      AppText(
                        text: "username",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.20,
                            child: LinearProgressIndicator(
                              value: 0.7, // 70% progress
                              backgroundColor: Colors.grey, // Background color
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.blue),
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          AppText(
                            text: "70% Profile Completed",
                            fontSize: 10,
                          )
                        ],
                      ),
                      AppSpacing.heigthSpace10,
                      Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width * 0.50,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(4)),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: InkWell(
                                  onTap: () {},
                                  child: ColoredBox(
                                    color: AppColors.primaryColor,
                                    child: Center(
                                      child: AppText(
                                        text: "Basic",
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )),
                            Container(
                              height: 30,
                              width: 1,
                              decoration:
                                  BoxDecoration(color: AppColors.primaryColor),
                            ),
                            Expanded(
                                flex: 3,
                                child: InkWell(
                                  onTap: () {},
                                  child: Center(
                                    child: AppText(
                                      text: "Upgrade Plan",
                                      fontSize: 10,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
