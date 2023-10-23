import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/utils/app_navigation.dart';
import 'package:nikahbay/views/matches/matches.dart';
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
                            AppText(text: "Religion"),
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
                            const AppText(text: "Islam"),
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
                            AppText(text: "Job"),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(text: "MS"),
                            AppText(text: "Not Specified"),
                          ],
                        ),
                      ],
                    ),
                    AppSpacing.heigthSpace30,
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
