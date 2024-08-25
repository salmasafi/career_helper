import 'package:flutter/material.dart';
import '../../helper/constants.dart';
import '../../logic/message_model.dart';

class ChatBubble extends StatelessWidget {
  final Message message;
  const ChatBubble({
    super.key,
    required this.message
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 32,
        ),
        decoration: const BoxDecoration(
          color: kSecondryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
            bottomRight: Radius.circular(28),
          ),
        ),
        child: Text(
          message.message,
          style: const TextStyle(
            color: kWhite,
          ),
        ),
      ),
    );
  }
}

class AnotherChatBubble extends StatelessWidget {
  final Message message;
  const AnotherChatBubble({
    super.key,
    required this.message
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 32,
        ),
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
            bottomLeft: Radius.circular(28),
          ),
        ),
        child: Text(
          message.message,
          style: const TextStyle(
            color: kWhite,
          ),
        ),
      ),
    );
  }
}
