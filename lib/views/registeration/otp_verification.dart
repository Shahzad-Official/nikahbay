import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nikahbay/constants/app_colors.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/widgets/app_logo.dart';
import 'package:nikahbay/widgets/app_text.dart';
import 'package:pinput/pinput.dart';

import '../../controllers/registeration_controllers/otp_controller.dart';
import '../../widgets/app_button.dart';

class OtpVerification extends StatefulWidget {
  final String email;
  final bool isForgetEmail;
  const OtpVerification({
    Key? key,
    required this.email,
    this.isForgetEmail = false,
  }) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final OtpController _controller = Get.put(OtpController());
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.primaryColor),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  get focusedPinTheme => defaultPinTheme.copyDecorationWith(
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(8),
      );

  get submittedPinTheme => defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: AppColors.secondaryColor.withOpacity(0.1),
        ),
      );

  @override
  void initState() {
    _controller.email = widget.email;
    _controller.startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _controller.disposeTimer();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          text: "OTP Verification",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.defaultPadding,
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              const AppLogo(),
              AppSpacing.heigthSpace30,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "A Verification Code has been sent to your email check your email:",
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: " ${widget.email}",
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.heigthSpace30,
              AppSpacing.heigthSpace30,
              GetBuilder<OtpController>(
                init: OtpController(),
                initState: (_) {},
                builder: (_) {
                  if (_.isResending) {
                    return const Center(
                      child: SpinKitThreeBounce(
                        color: AppColors.primaryColor,
                        size: 10,
                      ),
                    );
                  } else {
                    return RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: _.isOtpExpires ? "" : "Resend Code in: ",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: _.isOtpExpires ? "Resend Code" : "${_.otpTime}",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              color: _.isOtpExpires ? AppColors.primaryColor : Colors.black,
                              fontWeight: FontWeight.w600,
                              decoration: _.isOtpExpires ? TextDecoration.underline : null,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                if (_.isOtpExpires) {
                                  _controller.email = widget.email;
                                  await _.resendOtp(context);
                                  _controller.startTimer();
                                }
                              },
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              AppSpacing.heigthSpace30,
              Pinput(
                controller: _controller.otp,
                length: 5,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
              ),
              AppSpacing.heigthSpace30,
              GetBuilder<OtpController>(
                init: OtpController(),
                initState: (_) {},
                builder: (_) {
                  return AppButton(
                    isLoading: _.isLoading,
                    onTap: () async {
                      _controller.email = widget.email;
                      await _.verifyOtp(context, isForgetEmail: widget.isForgetEmail);
                    },
                    text: "VERIFY",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
