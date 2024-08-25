// ignore_for_file: must_be_immutable

import '../../helper/constants.dart';
import '../../logic/chat_service.dart';
import '../../logic/message_model.dart';
import '../../ui/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController textController = TextEditingController();

  ScrollController scrollController = ScrollController();

  List<Message> messagesList = [];
  List<Message> messagesListTemp = [];

  ChatService _chatService = ChatService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        title: Image.asset(
          kLogo,
          height: 130,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                controller: scrollController,
                itemBuilder: (context, index) {
                  if (messagesList[index].user == 'me') {
                    return ChatBubble(
                      message: messagesList[index],
                    );
                  } else {
                    return AnotherChatBubble(
                      message: messagesList[index],
                    );
                  }
                },
                itemCount: messagesList.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                controller: textController,
                onSubmitted: (value) async {
                  if (value != '') {
                    messagesListTemp.add(
                      Message(
                        message: value,
                        user: 'me',
                        date:
                            '${DateTime.now().day.toString()} ${DateFormat('MMMM yyyy').format(DateTime.now())} ${DateFormat('hh:mm:ss a').format(DateTime.now())}',
                      ),
                    );
                    messagesList = messagesListTemp.reversed.toList();

                    String aiResponse = await _chatService.sendMessage(value);
                    messagesListTemp.add(
                      Message(
                        message: aiResponse,
                        user: 'ai',
                        date:
                            '${DateTime.now().day.toString()} ${DateFormat('MMMM yyyy').format(DateTime.now())} ${DateFormat('hh:mm:ss a').format(DateTime.now())}',
                      ),
                    );
                    messagesList = messagesListTemp.reversed.toList();

                    setState(() {});

                    scrollController.animateTo(
                      //scrollController.position.maxScrollExtent,
                      0,
                      duration: const Duration(seconds: 1),
                      curve: Curves.linear,
                    );
                    textController.clear();
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: kPrimaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: kPrimaryColor),
                  ),
                  hintText: 'Send message',
                  suffixIcon: const Icon(Icons.send),
                  suffixIconColor: kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
