import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:nikahbay/constants/app_colors.dart';
import 'package:nikahbay/constants/app_spacing.dart';
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
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);

    _controller = CameraController(
      frontCamera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller!.initialize();
    if (!mounted) return;

    setState(() {});
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

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
      body: Column(
        children: [
          AppSpacing.heigthSpace20,
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_controller!);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            await _initializeControllerFuture;

            final image = await _controller!.takePicture();

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
      ),
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
                    AppNavigation.to(context, nextPage: const IDCardCameraScreen());
                  
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
