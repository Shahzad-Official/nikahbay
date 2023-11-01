import 'package:flutter/material.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/utils/app_navigation.dart';
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
          children: [
            AppSpacing.heigthSpace20,
            Container(
              height: 100,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppCachedImage(
                          height: 60,
                          width: 60,
                          borderRadius: BorderRadius.circular(22),
                          url:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgMwhAX_hGb3Edu6NsuFejVGrUpTV0-nchVw&usqp=CAU"),
                      SizedBox(
                        width: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
