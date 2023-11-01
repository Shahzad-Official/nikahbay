import 'package:get/get.dart';

class MainChatController extends GetxController {
  bool isNewMessage = false;


  changeIsNewStatus(bool value) {
    isNewMessage = value;
    update();
  }
}
