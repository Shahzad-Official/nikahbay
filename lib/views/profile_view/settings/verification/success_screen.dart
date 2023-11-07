import 'package:flutter/material.dart';
import 'package:nikahbay/utils/app_navigation.dart';
import 'package:nikahbay/views/main_page/main_page.dart';
import 'package:nikahbay/widgets/app_button.dart';

import 'package:nikahbay/widgets/app_text.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              const Spacer(
                flex: 2,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const AppText(
                  text: "We will let you know in 2-3 days after verification.",
                  color: Colors.white,
                  fontSize: 20,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              AppButton(
                text: "Go to HomePage",
                width: MediaQuery.of(context).size.width * 0.80,
                onTap: () {
                  AppNavigation.to(context, nextPage: const MainPage());
                },
                height: 55,
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
