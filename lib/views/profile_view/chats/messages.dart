import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nikahbay/constants/app_colors.dart';
import 'package:nikahbay/utils/app_navigation.dart';
import 'package:nikahbay/widgets/app_cached_image.dart';
import 'package:nikahbay/widgets/app_text.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final List<String> messages = [];
  final TextEditingController _textEditingController = TextEditingController();

  void _sendMessage(String message) {
    setState(() {
      messages.add(message);
      _textEditingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: "ABCD Morina",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                AppText(
                  text: "online",
                  fontSize: 12,
                  color: Colors.grey,
                )
              ],
            ),
          ],
        ),
        leading: InkWell(
          onTap: () {
            AppNavigation.back(context);
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        elevation: 0.3,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isSentByUser = index % 2 == 0;
                return Row(
                  mainAxisAlignment: isSentByUser
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    if (!isSentByUser)
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: AppCachedImage(
                          url:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSppkoKsaYMuIoNLDH7O8ePOacLPG1mKXtEng&usqp=CAU",
                          height: 33,
                          width: 33,
                          shape: BoxShape.circle,
                        ),
                      ),
                    Expanded(
                      child: Align(
                        alignment: isSentByUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.70,
                                ),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                              255, 226, 227, 231)
                                          .withOpacity(0.2),
                                      blurRadius: 6,
                                      spreadRadius: 2,
                                      offset: const Offset(0, 8),
                                    ),
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                              255, 226, 227, 231)
                                          .withOpacity(0.4),
                                      blurRadius: 14,
                                      spreadRadius: 4,
                                      offset: const Offset(0, 7),
                                    ),
                                  ],
                                  color: isSentByUser
                                      ? AppColors.primaryColor
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: AppText(
                                  text: messages[index],
                                  color: isSentByUser
                                      ? Colors.white
                                      : Colors.black,
                                  maxLines: null,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    if (isSentByUser)
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: AppCachedImage(
                          url: "https://www.w3schools.com/w3images/avatar2.png",
                          height: 33,
                          width: 33,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      hintStyle: GoogleFonts.aBeeZee(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(27),
                        borderSide: const BorderSide(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17),
                        borderSide: const BorderSide(
                          color: AppColors.primaryColor,
                          width: 2,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.emoji_emotions,
                        color: AppColors.primaryColor,
                      ),
                      border: const OutlineInputBorder(),
                      suffix: GestureDetector(
                        onTap: () {
                          if (_textEditingController.text.isNotEmpty) {
                            _sendMessage(_textEditingController.text);
                          }
                        },
                        child: const Icon(
                          Icons.send_outlined,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
