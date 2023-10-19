import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nikahbay/constants/app_colors.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/widgets/app_shadowcontainer.dart';
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
              const AppText(
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
              AppSpacing.heigthSpace20,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(5, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-GhyeRCrZKqtN9dIZzm1cWi0kBuUTTlA3KI7jFS9k&s",
                                    height: 100,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 6, top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        text: "Samantha Jones",
                                        fontWeight: FontWeight.w600,
                                      ),
                                      AppSpacing.heigthSpace5,
                                      AppText(
                                        text: "26yrs, 5ft 2inch",
                                        fontSize: 11,
                                        color:
                                            Color.fromARGB(255, 179, 178, 178),
                                      ),
                                      AppText(
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
                          )),
                    );
                  }),
                ),
              ),
              AppSpacing.heigthSpace30,
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
                            width: MediaQuery.of(context).size.width * 0.12,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
