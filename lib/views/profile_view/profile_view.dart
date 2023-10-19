import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nikahbay/constants/app_colors.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/widgets/app_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppSpacing.defaultPadding,
          child: Column(
            children: [
              const AppText(
                text: "Profile",
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
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        text: "Azhar Khan",
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                      const AppText(
                        text: "username",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.20,
                            child: const LinearProgressIndicator(
                              value: 0.7, // 70% progress
                              backgroundColor: Colors.grey, // Background color
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.blue),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const AppText(
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
                                  child: const ColoredBox(
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
                              decoration: const BoxDecoration(
                                  color: AppColors.primaryColor),
                            ),
                            Expanded(
                                flex: 3,
                                child: InkWell(
                                  onTap: () {},
                                  child: const Center(
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
              AppSpacing.heigthSpace30,
              ProfileWidget(
                title: 'Matches',
                icon: 'assets/icons/matches.svg',
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final String title, icon;
  final void Function()? onTap;
  const ProfileWidget({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 80,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.08,
                ),
                const SizedBox(
                  width: 10,
                ),
                AppText(
                  text: title,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.primaryColor,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
