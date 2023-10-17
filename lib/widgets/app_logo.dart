import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppLogo extends StatelessWidget {
  final bool isShadowLogo;
  const AppLogo({
    Key? key,
    this.isShadowLogo = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isShadowLogo ? 150 : 170,
      width: isShadowLogo ? 150 : 170,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: isShadowLogo
            ? [
                BoxShadow(
                  color: const Color(0xFFDED8D5).withOpacity(0.2),
                  blurRadius: 6,
                  spreadRadius: 2,
                  offset: const Offset(0, 8),
                ),
                BoxShadow(
                  color: const Color(0xFFDED8D5).withOpacity(0.5),
                  blurRadius: 14,
                  spreadRadius: 4,
                  offset: const Offset(0, 7),
                ),
              ]
            : null,
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: SvgPicture.asset(
            "assets/icons/logo.svg",
            height: isShadowLogo ? 100 : null,
            width: isShadowLogo ? 100 : null,
          ),
        ),
      ),
    );
  }
}
