import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CameraVerifyController extends GetxController {
  CameraController? camController;
  Future<void>? initializeControllerFuture;

  @override
  void onInit() {
    super.onInit();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);

    camController = CameraController(
      frontCamera,
      ResolutionPreset.medium,
    );

    initializeControllerFuture = camController!.initialize();
    if (camController != null) update();
  }

  @override
  void onClose() {
    if (camController != null) {
      camController!.dispose();
    }
    super.onClose();
  }
}

