import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:nikahbay/constants/app_colors.dart';
import 'package:nikahbay/widgets/app_text.dart';

class AppField extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon, suffixIcon;
  final String? hintText, labelText;
  final TextInputType? textType;
  final bool isObsecure, readOnly;
  final void Function()? onTap;
  final int maxLines;
  const AppField({
    super.key,
    this.controller,
    this.prefixIcon,
    this.hintText,
    this.textType,
    this.suffixIcon,
    this.isObsecure = false,
    this.onTap,
    this.labelText,
    this.readOnly = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          primary: AppColors.primaryColor,
          secondary: AppColors.primaryColor,
        ),
      ),
      child: TextFormField(
        maxLines: maxLines,
        onTap: onTap,
        readOnly: readOnly,
        obscureText: isObsecure,
        keyboardType: textType,
        controller: controller,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: labelText ?? hintText,
          labelStyle: GoogleFonts.poppins(),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(),
          contentPadding: const EdgeInsets.all(10),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

class DropdownContainer extends StatelessWidget {
  final Object? currentValue;
  final List<String> items;
  final void Function(Object? value)? onValueChange;
  final String? hintText, label;

  const DropdownContainer({
    Key? key,
    required this.currentValue,
    required this.items,
    required this.onValueChange,
    this.hintText,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Row(
            children: [
              AppText(
                text: label ?? "",
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: DropdownButtonFormField(
                hint: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    hintText ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff7B7A7A),
                    ),
                  ),
                ),
                icon:
                    const Icon(Icons.arrow_drop_down_sharp, color: Colors.grey),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                ),
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff7B7A7A),
                ),
                value: currentValue,
                items: items
                    .map(
                      (e) => DropdownMenuItem(
                        alignment: Alignment.centerLeft,
                        value: e,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 22),
                          child: Text(
                            e,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff7B7A7A),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: onValueChange,
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppPhoneField extends StatelessWidget {
  final String? initialCountry;
  final TextEditingController? controller;
  final String? hintText;
  final void Function(PhoneNumber number)? onChanged;
  const AppPhoneField({
    Key? key,
    this.initialCountry,
    this.controller,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          primary: AppColors.primaryColor,
          secondary: AppColors.primaryColor,
        ),
      ),
      child: IntlPhoneField(
        controller: controller,
        initialCountryCode: initialCountry,
        onChanged: onChanged,
        decoration: InputDecoration(
          counterText: "",
          labelText: hintText,
          labelStyle: GoogleFonts.poppins(),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(),
          contentPadding: const EdgeInsets.all(10),
          border: InputBorder.none,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,
              width: 2,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
