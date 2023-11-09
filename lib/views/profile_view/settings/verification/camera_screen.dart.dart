import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:nikahbay/constants/app_colors.dart';
import 'package:nikahbay/constants/app_spacing.dart';
import 'package:nikahbay/controllers/profile_view_controller/camera_controller.dart';
import 'package:nikahbay/utils/app_navigation.dart';
import 'package:nikahbay/views/profile_view/settings/verification/id_card.dart';
import 'package:nikahbay/widgets/app_button.dart';
import 'package:nikahbay/widgets/app_text.dart';

class CamerScreen extends StatefulWidget {
  const CamerScreen({super.key});

  @override
  State<CamerScreen> createState() => _CamerScreenState();
}

class _CamerScreenState extends State<CamerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(text: "Take Selfie"),
        leading: InkWell(
            onTap: () {
              AppNavigation.back(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: GetBuilder<CameraVerifyController>(
          init: CameraVerifyController(),
          builder: (controller) {
            return Column(
              children: [
                AppSpacing.heigthSpace20,
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FutureBuilder<void>(
                    future: controller.initializeControllerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return CameraPreview(controller.camController!);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ],
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GetBuilder<CameraVerifyController>(
          init: CameraVerifyController(),
          builder: (con) {
            return FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              child: const Icon(Icons.camera_alt),
              onPressed: () async {
                try {
                  await con.initializeControllerFuture;

                  final image = await con.camController!.takePicture();

                  // ignore: use_build_context_synchronously
                  AppNavigation.to(
                    context,
                    nextPage: DisplayPictureScreen(imagePath: image.path),
                  );
                } catch (e) {
                  if (kDebugMode) {
                    print(e);
                  }
                }
              },
            );
          }),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(text: "Preview"),
        leading: InkWell(
            onTap: () {
              AppNavigation.back(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(3.141),
              child: Image.file(File(imagePath)),
            ),
          ),
          Padding(
            padding: AppSpacing.defaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(
                  text: "Note",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                const AppText(text: "Image Should be clear in light!"),
                AppSpacing.heigthSpace10,
                AppButton(
                  text: "Next ",
                  onTap: () {
                    AppNavigation.to(context,
                        nextPage:  IDCardCameraScreen());
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
