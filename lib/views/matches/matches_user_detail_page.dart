import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nikahbay/constants/app_colors.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/controllers/matches_controller/mtacches_detail.dart';
import 'package:nikahbay/utils/app_navigation.dart';
import 'package:nikahbay/views/matches/matches.dart';
import 'package:nikahbay/views/matches/mtaches_detail_screens/professional_info.dart';
import 'package:nikahbay/views/matches/mtaches_detail_screens/personal_info.dart';
import 'package:nikahbay/views/matches/mtaches_detail_screens/preferences.dart';
import 'package:nikahbay/views/matches/mtaches_detail_screens/religion_info.dart';
import 'package:nikahbay/widgets/app_cached_image.dart';
import 'package:nikahbay/widgets/app_text.dart';

class MatchDetail extends StatefulWidget {
  final MatchData match;

  const MatchDetail({super.key, required this.match});

  @override
  State<MatchDetail> createState() => _MatchDetailState();
}

class _MatchDetailState extends State<MatchDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  AppCachedImage(
                    url: widget.match.imageUrl,
                    fit: BoxFit.cover,
                    height: 225,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: AppSpacing.defaultPadding,
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  AppNavigation.back(context);
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              AppText(
                                text: widget.match.name,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                        height: 32,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.22,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.white, width: 2)),
                                        child: const Icon(
                                          Icons.star_border,
                                          color: Colors.white,
                                        )),
                                  ),
                                  const AppText(
                                    text: "Shortlist",
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                        height: 32,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.22,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.white, width: 2)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: SvgPicture.asset(
                                            "assets/icons/chat.svg",
                                            // ignore: deprecated_member_use
                                            color: Colors.white,
                                          ),
                                        )),
                                  ),
                                  const AppText(
                                    text: "Chat Now",
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              AppSpacing.heigthSpace10,
              GetBuilder<MatchesDetailController>(
                  init: MatchesDetailController(),
                  initState: (state) {},
                  builder: (controller) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  controller.changeIndex(0);
                                },
                                child: Column(
                                  children: [
                                    AppText(
                                      text: "Personal Info",
                                      color: controller.selectedIndex == 0
                                          ? AppColors.primaryColor
                                          : Colors.grey.withOpacity(0.7),
                                      fontSize: 11,
                                    ),
                                    SizedBox(
                                        child: Divider(
                                      thickness: 2,
                                      color: controller.selectedIndex == 0
                                          ? AppColors.primaryColor
                                          : Colors.grey.withOpacity(0.7),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  controller.changeIndex(1);
                                },
                                child: Column(
                                  children: [
                                    AppText(
                                      text: "Religion Info",
                                      fontSize: 11,
                                      color: controller.selectedIndex == 1
                                          ? AppColors.primaryColor
                                          : Colors.grey.withOpacity(0.7),
                                    ),
                                    SizedBox(
                                        child: Divider(
                                      thickness: 2,
                                      color: controller.selectedIndex == 1
                                          ? AppColors.primaryColor
                                          : Colors.grey.withOpacity(0.7),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  controller.changeIndex(2);
                                },
                                child: Column(
                                  children: [
                                    AppText(
                                      text: "Preferences",
                                      fontSize: 11,
                                      color: controller.selectedIndex == 2
                                          ? AppColors.primaryColor
                                          : Colors.grey.withOpacity(0.7),
                                    ),
                                    SizedBox(
                                        child: Divider(
                                      thickness: 2,
                                      color: controller.selectedIndex == 2
                                          ? AppColors.primaryColor
                                          : Colors.grey.withOpacity(0.7),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  controller.changeIndex(3);
                                },
                                child: Column(
                                  children: [
                                    AppText(
                                      text: "Professional Info",
                                      fontSize: 11,
                                      color: controller.selectedIndex == 3
                                          ? AppColors.primaryColor
                                          : Colors.grey.withOpacity(0.7),
                                    ),
                                    SizedBox(
                                        child: Divider(
                                      thickness: 2,
                                      color: controller.selectedIndex == 3
                                          ? AppColors.primaryColor
                                          : Colors.grey.withOpacity(0.7),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        controller.selectedIndex == 0
                            ? PersonalInfo(
                                match: widget.match,
                              )
                            : controller.selectedIndex == 1
                                ? const ReligionInfo()
                                : controller.selectedIndex == 2
                                    ? const Preferences()
                                    : const ProfessionalInfo(),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
