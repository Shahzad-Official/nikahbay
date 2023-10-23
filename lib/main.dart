import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikahbay/controllers/theme.dart';
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
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      home: const MainPage(),
    );
  }
}
