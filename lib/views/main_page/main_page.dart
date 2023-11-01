import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nikahbay/constants/app_colors.dart';
import 'package:nikahbay/controllers/main_page_controller.dart';
import 'package:nikahbay/widgets/app_text.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController _pageController;
  final MainPageController _controller = Get.put(MainPageController());

  @override
  void initState() {
    _pageController = PageController(
      initialPage: _controller.selectedIndex,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainPageController>(
        init: MainPageController(),
        builder: (controller) {
          return PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (value) {
              controller.changeIndex(value);
            },
            itemCount: controller.allPages.length,
            itemBuilder: (context, index) {
              return controller.allPages[index];
            },
          );
        },
      ),
      bottomNavigationBar: GetBuilder<MainPageController>(
        init: MainPageController(),
        builder: (_) {
          return SalomonBottomBar(
            currentIndex: _.selectedIndex,
            onTap: (value) {
              _.changeIndex(value);
              _pageController.animateToPage(
                value,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
            items: [
              SalomonBottomBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/home.svg",
                  height: 30,
                  width: 30,
                  // ignore: deprecated_member_use
                  color: _.selectedIndex == 0
                      ? AppColors.primaryColor
                      : Colors.black,
                ),
                title: const AppText(
                  text: "Home",
                ),
              ),
              SalomonBottomBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/matches.svg",
                  height: 30,
                  width: 30,
                  // ignore: deprecated_member_use
                  color: _.selectedIndex == 1
                      ? AppColors.primaryColor
                      : Colors.black,
                ),
                title: const AppText(
                  text: "Matches",
                ),
              ),
              SalomonBottomBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/star.svg",
                  height: 30,
                  width: 30,
                  // ignore: deprecated_member_use
                  color: _.selectedIndex == 2
                      ? AppColors.primaryColor
                      : Colors.black,
                ),
                title: const AppText(
                  text: "Favorite",
                ),
              ),
              SalomonBottomBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/profile.svg",
                  height: 30,
                  width: 30,
                  // ignore: deprecated_member_use
                  color: _.selectedIndex == 3
                      ? AppColors.primaryColor
                      : Colors.black,
                ),
                title: const AppText(
                  text: "Profile",
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
