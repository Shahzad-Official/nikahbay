// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nikahbay/utils/app_navigation.dart';
import 'package:nikahbay/views/profile_view/settings/verification/verify_account.dart';
import 'package:nikahbay/widgets/app_text.dart';

class IDCardCameraScreen extends StatefulWidget {
  const IDCardCameraScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IDCardCameraScreenState createState() => _IDCardCameraScreenState();
}

class _IDCardCameraScreenState extends State<IDCardCameraScreen> {
  CameraController? _cameraController;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);

    _cameraController = CameraController(firstCamera, ResolutionPreset.high);
    _initializeControllerFuture = _cameraController!.initialize().then((_) {
      if (mounted) {
        setState(
            () {}); // Trigger a state update when the camera is initialized
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('Error initializing camera: $error');
      }
    });
  }

  @override
  void dispose() {
    _cameraController!.dispose();
    super.dispose();
  }

  Future<XFile?> _takePicture() async {
    try {
      await _initializeControllerFuture;

      XFile picture = await _cameraController!.takePicture();
      return picture;
    } catch (e) {
      if (kDebugMode) {
        print("Error taking picture: $e");
      }
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(text: "ID Card Camera"),
        leading: InkWell(
            onTap: () {
              AppNavigation.to(context, nextPage: const VerifyAccount());
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_cameraController!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          XFile? image = await _takePicture();
          if (image != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      IDCardViewScreen(imagePath: image.path)),
            );
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class IDCardViewScreen extends StatelessWidget {
  final String imagePath;

  const IDCardViewScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const AppText(text: "ID Card Preview"),
        leading: InkWell(
            onTap: () {
              AppNavigation.to(context, nextPage: const VerifyAccount());
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Center(
        child: Image.file(File(imagePath)),
      ),
    );
  }
}
