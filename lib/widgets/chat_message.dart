import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(
      {Key? key,
      required this.text,
      required this.uuid,
      required this.animationController})
      : super(key: key);

  final String text;
  final String uuid;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        // animation to fade
        opacity: animationController,
        child: SizeTransition(
            // animation t opush a message to another
            sizeFactor: CurvedAnimation(
                parent: animationController, curve: Curves.easeOut),
            child: Container(
                child: uuid == '123' ? _myMessage() : _otherMessage())));
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(right: 5, bottom: 5, left: 50),
        padding: const EdgeInsets.all(8),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
            color: const Color(0xff4D9EF6),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget _otherMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 5, bottom: 5, right: 50),
        padding: const EdgeInsets.all(8),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black87),
        ),
        decoration: BoxDecoration(
            color: const Color(0xffE4E5E8),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
