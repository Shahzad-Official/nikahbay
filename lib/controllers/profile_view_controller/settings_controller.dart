import 'package:get/get.dart';

class SettingsController extends GetxController {
  var isSwitched = false.obs;
  

  void changeSwitch(bool value) {
    isSwitched.value = value;
    update();
  }
  
}
