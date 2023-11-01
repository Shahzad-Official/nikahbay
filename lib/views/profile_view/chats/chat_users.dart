import 'package:flutter/material.dart';
import 'package:nikahbay/constants/app_colors.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/utils/app_navigation.dart';
import 'package:nikahbay/views/profile_view/chats/messages.dart';
import 'package:nikahbay/widgets/app_cached_image.dart';
import 'package:nikahbay/widgets/app_text.dart';

class ChatUsers extends StatelessWidget {
  const ChatUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(text: "Chats"),
        leading: InkWell(
            onTap: () {
              AppNavigation.back(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Padding(
        padding: AppSpacing.defaultPadding,
        child: Column(
            children: List.generate(3, (index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  AppNavigation.to(context, nextPage: MessagesScreen());
                },
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              AppCachedImage(
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                  borderRadius: BorderRadius.circular(22),
                                  url:
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgMwhAX_hGb3Edu6NsuFejVGrUpTV0-nchVw&usqp=CAU"),
                              const SizedBox(
                                width: 12,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        text: "ABCD Morina",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      AppText(
                                        text: "Lorem ipsum abcd",
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const AppText(
                                text: "11:20",
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                              Container(
                                height: 20,
                                width: 20,
                                decoration: const BoxDecoration(
                                  color: AppColors.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: AppText(
                                    text: "2",
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        width: double.infinity,
                        child: Divider(
                          color: Colors.grey,
                          thickness: 0.2,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        })),
      ),
    );
  }
}
