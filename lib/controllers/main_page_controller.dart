
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikahbay/views/main_page/home_view.dart';
import 'package:nikahbay/views/matches/matches.dart';
import 'package:nikahbay/views/profile_view/profile_view.dart';
import 'package:nikahbay/views/search_view/search_view.dart';

class MainPageController extends GetxController {
  int selectedIndex = 0;
  changeIndex(int index) {
    selectedIndex = index;
    update();
  }

  List<Widget> allPages =  [
    const HomeView(),
    const MatchesView(),
    const SearchView(),
    const ProfileView(),
  ];
}
