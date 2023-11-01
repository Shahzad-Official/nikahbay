import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  ItemScrollController scrollController = ItemScrollController();
  // ScrollController scrollController = ScrollController();
  TextEditingController message = TextEditingController();
  void sendMessage({
    required String senderId,
    required String receiverId,
    required String roomId,
  }) {
    if (message.text.isNotEmpty) {
  

      if (scrollController.isAttached) {
   
      }
      message.clear();
    
      update();
    }
  }

  bool isTyping = false;
  bool isOnline = false;
 
  scrollToDown() {
 
  }
}
