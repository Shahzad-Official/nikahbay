import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SettingsController extends GetxController {
  bool isSwitched = false;
  void changeSwitch(bool value) {
    isSwitched = value;
    update();
  }
}
