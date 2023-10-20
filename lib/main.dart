import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nikahbay/constants/app_colors.dart';
import 'package:nikahbay/views/main_page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NikahBay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(
          indicatorShape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        brightness: Brightness.light,
        primarySwatch: AppColors().customMaterialColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.darkColor,
          primary: AppColors.primaryColor,
          secondary: AppColors.secondaryColor,
        ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
