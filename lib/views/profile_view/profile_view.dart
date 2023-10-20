import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nikahbay/constants/app_colors.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/widgets/app_cached_image.dart';
import 'package:nikahbay/widgets/app_text.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
              AppSpacing.heigthSpace10,
              SizedBox(
                height: 120,
                width: 120,
                child: Stack(
                  children: [
                    AppCachedImage(
                      height: 120,
                      width: 120,
                      shape: BoxShape.circle,
                      isShadow: true,
                      fit: BoxFit.cover,
                      url: "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: SvgPicture.asset(
                        "assets/icons/verify_tick.svg",
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.heigthSpace10,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppText(
                    text: "Azhar Khan",
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
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
                          decoration: const BoxDecoration(color: AppColors.primaryColor),
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
              ),
              AppSpacing.heigthSpace30,
              ProfileWidget(
                title: 'Matches',
                icon: 'assets/icons/matches.svg',
                onTap: () {},
              ),
              ProfileWidget(
                title: 'Settings',
                icon: 'assets/icons/settings.svg',
                onTap: () {},
              ),
              ProfileWidget(
                title: 'Subscription Plans',
                icon: 'assets/icons/subscription.svg',
                onTap: () {},
              ),
              ProfileWidget(
                title: 'Chats',
                icon: 'assets/icons/chat.svg',
                onTap: () {},
              ),
              ProfileWidget(
                title: 'Notification',
                icon: 'assets/icons/notification.svg',
                onTap: () {},
              ),
              ProfileWidget(
                title: 'Profile Views',
                icon: 'assets/icons/views.svg',
                onTap: () {},
              ),
              ProfileWidget(
                title: 'Shortlisted',
                icon: 'assets/icons/favorite.svg',
                onTap: () {},
              ),
              AppSpacing.heigthSpace10,
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/logout.svg',
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.08,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  AppText(text: "Logout")
                ],
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
        height: 55,
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
                  fontSize: 17,
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
