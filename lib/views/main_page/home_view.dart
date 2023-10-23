import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nikahbay/constants/app_colors.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/widgets/app_button.dart';
import 'package:nikahbay/widgets/app_cached_image.dart';
import 'package:nikahbay/widgets/app_shadowcontainer.dart';
import 'package:nikahbay/widgets/app_text.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const AppText(text: "Home"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: AppSpacing.defaultPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: AppCachedImage(
                            url:
                                "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
                            height: 140,
                            width: MediaQuery.of(context).size.width * 0.3,
                            fit: BoxFit.cover,
                            isShadow: true,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AppText(
                                text: "Azhar Khan",
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                              Row(
                                children: [
                                  const AppText(
                                    text: "Profile Completion",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  const Spacer(),
                                  CircularPercentIndicator(
                                    radius: 20,
                                    percent: 0.5,
                                    progressColor: AppColors.primaryColor,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    center: const AppText(
                                      text: "50%",
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Image.asset(
                                "assets/images/verified.png",
                                height: 20,
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
                                      ),
                                    ),
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
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    AppSpacing.heigthSpace20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AppText(
                          text: "New Matches",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const AppText(
                            text: "See all",
                            color: AppColors.primaryColor,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    5,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                          bottom: 20,
                          top: 10,
                        ),
                        child: AppShadowcontainer(
                          shape: BoxShape.rectangle,
                          height: 180,
                          width: MediaQuery.of(context).size.width * 0.40,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: AppCachedImage(
                                    url:
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-GhyeRCrZKqtN9dIZzm1cWi0kBuUTTlA3KI7jFS9k&s",
                                    height: 100,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 6, top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Flexible(
                                            child: AppText(
                                              text: "Samantha Jones ",
                                              fontWeight: FontWeight.w600,
                                              maxLines: 1,
                                              overFlow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SvgPicture.asset(
                                            "assets/icons/verify_tick.svg",
                                            height: 12,
                                            width: 12,
                                          ),
                                        ],
                                      ),
                                      AppSpacing.heigthSpace5,
                                      const AppText(
                                        text: "26yrs, 5ft 2inch",
                                        fontSize: 11,
                                        color:
                                            Color.fromARGB(255, 179, 178, 178),
                                      ),
                                      const AppText(
                                        text: "#1234 Multan Punjab",
                                        fontSize: 11,
                                        color:
                                            Color.fromARGB(255, 179, 178, 178),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: AppSpacing.defaultPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      text: "Discover Matches",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    AppSpacing.heigthSpace20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppShadowcontainer(
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.43,
                          shape: BoxShape.rectangle,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset("assets/icons/location.svg"),
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      text: "Location",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    AppText(
                                      text: "136 Matches",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        AppShadowcontainer(
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.43,
                          shape: BoxShape.rectangle,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/profession.svg",
                                  width:
                                      MediaQuery.of(context).size.width * 0.12,
                                ),
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      text: "Profession",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    AppText(
                                      text: "136 Matches",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    AppSpacing.heigthSpace20,
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor.withOpacity(0.14),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: AppSpacing.defaultPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  text:
                                      "Complete your profile for \nmore response",
                                  fontWeight: FontWeight.w500,
                                ),
                                Icon(
                                  Icons.timelapse_sharp,
                                  color: AppColors.primaryColor,
                                )
                              ],
                            ),
                            AppSpacing.heigthSpace30,
                            const AppText(
                              text:
                                  "You will get more chance to match\nwhen you complete your profile",
                              fontWeight: FontWeight.w500,
                            ),
                            AppSpacing.heigthSpace20,
                            Align(
                              alignment: Alignment.centerRight,
                              child: AppButton(
                                width: 120,
                                text: "Add Details",
                                fontSize: 14,
                                onTap: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
