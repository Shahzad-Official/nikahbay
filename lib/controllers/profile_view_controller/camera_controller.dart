// import 'package:camera/camera.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';


// class CameraPictureController extends GetxController {
//    CameraController? controller;
//    Future<void>? initializeControllerFuture;

//   CameraPictureController() {
//     _initializeCamera();
//   }

//   Future<void> _initializeCamera() async {
//     final cameras = await availableCameras();
//     final frontCamera = cameras.firstWhere(
//       (camera) => camera.lensDirection == CameraLensDirection.front,
//     );

//     controller = CameraController(
//       frontCamera,
//       ResolutionPreset.medium,
//     );

//     initializeControllerFuture = controller!.initialize();
//   }

//   @override
//   void dispose() {
//     controller!.dispose();
//     super.dispose();
//   }
// }
