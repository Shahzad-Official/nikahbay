import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SubscriptionPlanController extends GetxController {
  int selectedIndex = 0;
  changeIndex(int index) {
    selectedIndex = index;
    update();
  }
}
