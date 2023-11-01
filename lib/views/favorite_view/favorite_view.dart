import 'package:flutter/material.dart';
import 'package:nikahbay/constants/app_colors.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/utils/app_navigation.dart';
import 'package:nikahbay/views/matches/matches.dart';
import 'package:nikahbay/views/matches/matches_user_detail_page.dart';
import 'package:nikahbay/widgets/app_cached_image.dart';
import 'package:nikahbay/widgets/app_shadowcontainer.dart';
import 'package:nikahbay/widgets/app_text.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  final List<MatchData> matchess = [
    MatchData(
      name: "Krisha Jones",
      age: 26,
      height: "5ft 2inch",
      occupation: "Software Professional- Graduate",
      location: "Peshawar - Pakistan",
      imageUrl:
          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(text: "Favorites"),
      ),
      body: ListView.builder(
        itemCount: matchess.length,
        itemBuilder: (context, index) {
          final match = matchess[index];

          return Column(
            children: [
              Padding(
                padding: AppSpacing.defaultPadding,
                child: InkWell(
                  onTap: () {
                    AppNavigation.to(context,
                        nextPage: MatchDetail(
                          match: match,
                        ));
                  },
                  child: AppShadowcontainer(
                    shape: BoxShape.rectangle,
                    height: 385,
                    width: double.infinity,
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: AppCachedImage(
                              url: match.imageUrl,
                              fit: BoxFit.cover,
                              height: 200,
                              width: double.infinity,
                            )),
                        Padding(
                          padding: AppSpacing.defaultPadding,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: AppText(
                                      text: match.name,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.favorite,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              AppSpacing.heigthSpace5,
                              AppText(
                                text: match.occupation,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 184, 183, 182),
                              ),
                              AppSpacing.heigthSpace5,
                              AppText(
                                text:
                                    "${match.age.toString()} Yrs   ${match.height}",
                                fontWeight: FontWeight.w500,
                              ),
                              AppText(
                                text: match.location,
                                fontWeight: FontWeight.w500,
                              ),
                              AppSpacing.heigthSpace10,
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: AppColors.primaryColor),
                                    ),
                                    child: const Center(
                                      child: AppText(
                                        text: "Send Interest",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: AppColors.primaryColor),
                                    ),
                                    child: const Center(
                                      child: AppText(
                                        text: "Send Message",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
